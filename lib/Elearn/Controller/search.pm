package Elearn::Controller::search;
use Moose;
use namespace::autoclean;
use List::MoreUtils 'uniq';


BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::search - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 list

=cut

#Quick and dirty, list all videos
sub list :Chained('/') :Args(){
	my ($self, $c) = @_;
	my @lecture = $c->model('ElearnDB::lecture')->search({});
	my @items;
	my @ids;
	for my $field (@lecture){
		push(@items, {name => $field->name(), id => $field->id(), creator => $field->creator(), description => $field->description()} );
		push(@ids, $field->filename());
	}
	$c->stash(list => \@items);
	$c->stash(result => \@ids);
	$c->stash(header => ["All"] );	
	$c->stash(template =>'search/list.tt');
	
}

=head2 search
	Start of the search chain, just sets the template to use
=cut
sub search :Chained('/') CaptureArgs(0){
	my ($self, $c) = @_;	
	$c->stash(template =>'search/list.tt');	
}

=head2 tags
	Search by tags. Takes a list of tags and searches through the database for hits
=cut

sub tags :Chained('search') :Args(){
	my ($self, $c, @tags) = @_;
	$c->forward('getLectureFromTags',@tags);
	my $lectures = $c->stash()->{result};	
	my @result;
	@$lectures = uniq(@$lectures);
	for my $id (@$lectures){
		$c->log->debug($id);
		my $lecture = $c->model('ElearnDB::lecture')->find({filename => $id});
		push(@result, {name => $lecture->name(), id => $lecture->id(), creator => $lecture->creator(), description => $lecture->description()} );
	}
	$c->stash(header =>[@tags]);
	$c->stash(list => [@result]);	
}

=head2 text
	Takes text input from the user and matches it against lectures
=cut
sub text :Chained('search') :Args(0){
	my ($self, $c) = @_;
	my $searchString = $c->request->params->{searchString}|| 'Any';
	my $tmp;
	my @lectures;
	my $category = $c->request->params->{category}|| 'N/A';;
	my @args = split(" ",$searchString);;
	if($searchString eq 'Any'){
		$c->forward('list');
		$tmp =$c->stash()->{result};
		@lectures = @$tmp;
	}
	else{
		$c->forward("getLectureFromTags",[@args]);
		$tmp =$c->stash()->{result};
		@lectures = @$tmp;	
		$c->forward("getLectureFromDescription",[@args]);
		$tmp =$c->stash()->{result};
		push(@lectures,@$tmp);
		$tmp = $c->forward("getLectureFromName",[@args]);
		$tmp =$c->stash()->{result};
		push(@lectures,@$tmp);
	}
	@lectures = uniq(@lectures);	
	my @result;
	if($category eq 'any'){
		for my $id (@lectures){
			my $lecture = $c->model('ElearnDB::lecture')->find({filename => $id});
			push(@result, {name => $lecture->name(), id => $lecture->id(), description => $lecture->description()} );
		}
	}
	else{
		for my $id (@lectures){
			my $lecture = $c->model('ElearnDB::lecture')->search({filename => $id, category => $category})->single();
			if (defined $lecture){
				push(@result, {name => $lecture->name(), id => $lecture->id(), creator => $lecture->creator(), description => $lecture->description()} );
			}
		}
	}
	$c->stash(category => "in category, $category");
	$c->stash(header =>[@args]);
	$c->stash(list => [@result]);		
}

=head2 creator
Get all lectures from a specific user
=cut

sub creator :Chained('search') :Args(1){
	my ($self, $c, $creator) = @_;
	my @lectures = $c->model('ElearnDB::lecture')->search({creator => $creator});
	my @result;	
	for my $lecture (@lectures){
		push(@result, {name => $lecture->name(), id => $lecture->id(),creator => $lecture->creator(), description => $lecture->description()} );
	}
	$c->stash(header => "Author, $creator");
	$c->stash(list => \@result);		
}

=head2 getWatchedLectures

=cut
sub getWatchedLectures :Chained('search') :Args(2){
	my ($self, $c, $condition, $nr) = @_;
	my @lectures = $c->model('ElearnDB::lecture')->search({times_watched => {$condition ,$nr}});
	my @result;	
	for my $lecture (@lectures){
		push(@result, {name => $lecture->name(), id => $lecture->id(),creator => $lecture->creator(), description => $lecture->description()} );
	$c->stash(header => "Watched lectures");
	$c->stash(list => \@result);		
	}
}

=head2 getLectureFromTags
		Takes a list of tags and returns a list of lectures (primary key: filename) with matching tags
=cut

sub getLectureFromTags :Action()
{
	my ($self, $c, @tags) = @_;
	my @lectures;
	$c->log->debug("Searching for tags: ");
	my @hits;	
	for my $tag (@tags){
		push(@hits, $c->model('ElearnDB::lectureHasTags')->search({tag => $tag}));
	}
	for my $id (@hits){
		push(@lectures, $id->lectureid()->filename);
	}
	$c->stash({list => \@lectures}); #puts all the data on the stash
}

=head2 getLectureFromDescription
	Takes a list of tags and returns a list of lectures (primary key: filename) with close matching description
=cut

sub getLectureFromDescription :Action(){
	my ($self, $c, @tags) = @_;
	my @lectures;
	my @hits;	
	for my $tag (@tags){
		push(@hits, $c->model('ElearnDB::lecture')->search({description => { -like => "%".$tag."%"}}));
		$c->log->info("Looking for matching description for: $tag");
	}
	for my $id (@hits){
		push(@lectures, $id->filename);
	}
	$c->stash({result => \@lectures});
}

=head2 getLectureFromName
	Takes a list of words and matches them against the lectures names. Returns a list of lecture primary keys
=cut

sub getLectureFromName :Action() {
	my ($self, $c, @tags) = @_;
	my @lectures;
	$c->log->debug("Searching for name: ");
	my @hits;	
	for my $tag (@tags){
		push(@hits, $c->model('ElearnDB::lecture')->search({name => { -like => "%".$tag."%"}}));
		$c->log->debug("Looking for matching description for: $tag");
	}
	for my $id (@hits){
		push(@lectures, $id->filename);
	}
	$c->stash({result => \@lectures});
}

=head2 getRemembered
	THe user can choose to remeber lectures, this lets the user remeber them
=cut

sub getRemembered :Chained('search'){
	my ($self, $c) = @_;
	my @found_lectures=  $c->model('ElearnDB::userLectureData')->search({ user => $c->forward('/getUserName'), favorite => 1});
	my @result;
	my @lectures;
	for my $hit (@found_lectures){
		push(@lectures, $c->model('ElearnDB::lecture')->find({filename => $hit->lecture()}));
	}
	for my $lecture (@lectures){
		push(@result, {name => $lecture->name(), id => $lecture->id(),creator => $lecture->creator(), description => $lecture->description()} );
	}
	$c->stash(header => "Remembered lectures");
	$c->stash(list => \@result);	
}

=head2 getRecomended
	Lets the user find lectures recomended by proffesionals
=cut

sub getRecomended :Chained('search'){
	my ($self, $c) = @_;
	my @lectures = $c->model('ElearnDB::lecture')->find({recomended => 1});	
	$c->forward('getInfoFromResultSet', \@lectures);
	$c->stash(header => "Recomended lectures");
}

=head2 getLecturesInfoFromResultSet
	Takes a list of resultsets sorts it and makes it uniqe and returns all lecture info
=cut

sub getInfoFromResultSet :Action{
	my ($self, $c, @lectures) = @_;
	my @result;
	@lectures = uniq(@lectures);
	for my $lecture (@lectures){		
		if(defined $lecture){
			push(@result, {name => $lecture->name(), id => $lecture->id(),creator => $lecture->creator(), description => $lecture->description()} );
		}
	}
	$c->stash(list => \@result);
}
=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

