package Elearn::Controller::E_learning::search;
use Moose;
use namespace::autoclean;
use List::MoreUtils 'uniq';


BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::E_learningsearch - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 list

=cut

#Quick and dirty, list all videos
sub list :Chained('/') :Args(0){
	my ($self, $c) = @_;
	my @lecture = $c->model('E_Learning::ElearnDB::lecture')->search({});
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
	$c->forward('getLectureFromTags',\@tags);
	my $tmp = $c->stash()->{result};	
	my @lectures = @$tmp;
	$c->forward('getInfoFromID',\@lectures);
	$c->stash(header =>[@tags]);
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
	my @args = split(" ",$searchString);
	#Empty string, match everything
	if($searchString eq 'Any'){
		$c->forward('list');
		$tmp =$c->stash()->{result};
		@lectures = @$tmp;
	}
	#Matches the query against tags, description and name
	#Results are returned as a list of ids
	else{
		$c->forward("getLectureFromTags",\@args);
		$tmp =$c->stash()->{result};
		@lectures = @$tmp;	
		$c->forward("getLectureFromDescription",\@args);
		$tmp =$c->stash()->{result};
		push(@lectures,@$tmp);
		$tmp = $c->forward("getLectureFromName",\@args);
		$tmp =$c->stash()->{result};
		push(@lectures,@$tmp);
	}
	#Make sure all the ids are unique
	@lectures = uniq(@lectures);	
	my @result;
	#If the category is any, all hits should be displayed
	if($category eq 'any'){
		$c->forward('getInfoFromID',\@lectures);
	}
	#Otherwise only lectures with the coresponding category should be shown
	else{
		for my $id (@lectures){
			my $lecture = $c->model('E_Learning::ElearnDB::lecture')->search({filename => $id, category => $category})->single();
			if (defined $lecture){
				push(@result, {name => $lecture->name(), id => $lecture->id(), creator => $lecture->creator(), description => $lecture->description()} );
			}
		}
		$c->stash(list => \@result);		
	}
	$c->stash(category => "in category, $category");
	$c->stash(header =>\@args);	
}

=head2 creator
	Get all lectures from a specific user
=cut

sub creator :Chained('search') :Args(1){
	my ($self, $c, $creator) = @_;
	my @lectures = $c->model('E_Learning::ElearnDB::lecture')->search({creator => $creator});
	$c->forward('getInfoFromResultset', \@lectures);
	$c->stash(header => "Author, $creator");
}

=head2 getWatchedLectures

=cut
sub getWatchedLectures :Chained('search') :Args(2){
	my ($self, $c, $condition, $nr) = @_;
	my @lectures = $c->model('E_Learning::ElearnDB::lecture')->search({times_watched => {$condition ,$nr}});
	$c->forward('getInfoFromResultset', \@lectures);
	$c->stash(header => "Watched lectures");		
}

=head2 getLectureFromTags
		Takes a list of tags and returns a list of lectures (primary key: filename) with matching tags
=cut

sub getLectureFromTags :Action(){
	my ($self, $c, @tags) = @_;
	my @lectures;
	my @hits;	
	for my $tag (@tags){
		push(@hits, $c->model('E_Learning::ElearnDB::lectureHasTags')->search({tag => $tag}));
	}
	for my $id (@hits){
		push(@lectures, $id->lectureid()->filename);
	}
	$c->stash(result => \@lectures); #puts all the data on the stash
}

=head2 getLectureFromDescription
	Takes a list of tags and returns a list of lectures (primary key: filename) with close matching description
=cut

sub getLectureFromDescription :Action(){
	my ($self, $c, @tags) = @_;
	my @lectures;
	my @hits;	
	for my $tag (@tags){
		push(@hits, $c->model('E_Learing::ElearnDB::lecture')->search({description => { -like => "%".$tag."%"}}));
		$c->log->info("Looking for matching description for: $tag");
	}
	for my $id (@hits){
		push(@lectures, $id->filename);
	}
	$c->stash(result => \@lectures);
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
		push(@hits, $c->model('E_Learning::ElearnDB::lecture')->search({name => { -like => "%".$tag."%"}}));
		$c->log->debug("Looking for matching description for: $tag");
	}
	for my $id (@hits){
		push(@lectures, $id->filename);
	}
	$c->stash(result => \@lectures);
}

=head2 getRemembered
	THe user can choose to remeber lectures, this lets the user remeber them
=cut

sub getRemembered :Chained('search'){
	my ($self, $c) = @_;
	my @found_lectures=  $c->model('E_Learning::ElearnDB::userLectureData')->search({ user => $c->forward('/getUserName'), favorite => 1});
	my @lectures;
	#Find all lectures in the lecture database
	for my $hit (@found_lectures){
		push(@lectures, $c->model('E_Learning::ElearnDB::lecture')->find({filename => $hit->lecture->filename()}));
	}
	$c->forward('getInfoFromResultset', \@lectures);
	$c->stash(header => "Remembered lectures");
}

=head2 getRecomended
	Lets the user find lectures recomended by proffesionals
=cut

sub getRecomended :Chained('search'){
	my ($self, $c) = @_;
	my @lectures = $c->model('E_Learning::ElearnDB::lecture')->find({recomended => 1});	
	$c->forward('getInfoFromResultset', \@lectures);
	$c->stash(header => "Recomended lectures");
}

=head2 getInfoFromResultset
	Takes a list of resultsets sorts it and makes it uniqe and returns all lecture info
=cut

sub getInfoFromResultset :Action{
	my ($self, $c, @lectures) = @_;
	my @result;
	for my $lecture (@lectures){		
		$c->log->debug("getInfoFromResult ".$lecture->name());
		if(defined $lecture){
			push(@result, {name => $lecture->name(), id => $lecture->id(),creator => $lecture->creator(), description => $lecture->description()} );
		}
	}
	$c->stash(list => \@result);
}

=head2 getInfoFromID
	Takes a list of ids and finds the coresponding lectures, then uses getInfoFromResultset to put the data on the stash
=cut

sub getInfoFromID :Action{
	my ($self, $c, @ids) = @_;
	@ids = uniq(@ids);
	my @lectures;
	for my $id (@ids){
		$c->log->debug("geInfoFromID: Looking for id: $id");
		push(@lectures,$c->model('E_Learning::ElearnDB::lecture')->find({filename => $id}));
	}
	$c->forward('getInfoFromResultset', \@lectures);
}
=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

