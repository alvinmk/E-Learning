package Elearn::Controller::E_learning::edit;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::E_learning::edit - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 Edit
	Lets the user edit a lecture
=cut

sub edit :Chained('/') :Args(1){
	my ($self, $c, $id) = @_;
	my $lecture = $c->model('E_Learning::ElearnDB::lecture')->find($id);
	my @tags = $c->model('E_Learning::ElearnDB::lectureHasTags')->search({lectureid => $id});
	my @tmp;
	for my $field (@tags){
		push(@tmp, $field->tag()->tag());
	}
	my @chapterData;
	my @chapters = $c->model('E_Learning::ElearnDB::chapter')->search({lectureid => $id});
	for my $field (@chapters){
		$c->log->debug($field->start()."->".$field->stop().":".$field->chapter());
		push(@chapterData, $field->start()."->".$field->stop().":".$field->chapter());
	}
	my @categories = $c->model('E_Learning::ElearnDB::categories')->search({})->get_column('category')->all;
	$c->stash(description => $lecture->description());
	$c->stash(title => $lecture->name());
	$c->stash(lecturePath => "/LectureData/shared/");
	$c->stash(lecture => $lecture->filename());
	$c->stash(fileExtension => $lecture->filetype());
	$c->stash(creator => $lecture->creator() );
	$c->stash(tags => [@tmp]);
	$c->stash(chapters => [@chapterData]);
	$c->stash(id => $lecture->filename());
	$c->stash(template => 'upload/edit.tt');
	$c->stash(categories => \@categories);
}

=head2 editDone
	Takes the data from the form and updates the database
=cut

sub editDone :Local :Args(0){
	my ($self, $c) = @_;
	my $title = $c->request->params->{title}     || 'N/A';
	my $description    = $c->request->params->{description}    || 'N/A';
	my $category = $c->request->params->{category} || 'N/A';
	my $availability = $c->request->params->{availability} || 'N/A';
	my $videoID = $c->request->params->{id} || 'N/A';
	my @tags = split(',', ($c->request->params->{tags} || 'N/A') );
	my @chapterList = split(',', ($c->request->params->{chapters} || 'N/A') );
	my $chapters ={};
	#Take all start->stop:chapter and store them with chapter as non unique key
	for my $value (@chapterList){
		if($value =~ /->/)
		{
			$value =~s/^\s+|\s+$//g; #Strip whitespaces from array elements
			$c->log->debug($value);
			my @tmp = split(':', $value); #Time and chapter in separate indices
			$tmp[0] =~ m/(.*)->(.*)/; #Get times
			push( @{$chapters->{$tmp[1]}}, "$1:$2" );
		}
	}
	my @tmp;
	for my $tag (@tags){
		$tag =~s/^\s+|\s+$//g; #Strip whitespaces from array elements
		if($tag ne ""){
			push(@tmp, $tag);
		}
	}
	@tags = @tmp;
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
	$year+=1900; #Get year in a meaningful format
	my $data = {
		ID => $videoID,
		TITLE => $title,
		DESCRIPTION => $description,
		CREATOR => $c->forward('/getUserName'),
		TAGS => [@tags],
		CHAPTERS => $chapters,
		CATEGORY => $category,
		AVAILABILITY => $availability,
		CREATED => "$year-$mon-$mday", #Store it in the same format as mysql
	};
	#Remove chapters and tags for lecture
	$c->model('E_Learning::ElearnDB::lectureHasTags')->search({ lectureid => $videoID})->delete_all();
	$c->model('E_Learning::ElearnDB::chapter')->search({ lectureid => $videoID})->delete_all();
	#Update database
	$c->forward("Elearn::Controller::E_learning::edit", 'addToDB', [$data]);
	$c->response->redirect("/watch/$videoID");
}

=head2
	Add to database
=cut

sub addToDB :Private{
	my ($self, $c, $data) = @_;
	my $availability;
	$c->log->debug("ADDING VIDEO TO DATABASE");
	if($data->{AVAILABILITY} eq "public"){
		$availability=1;
	}
	else{
		$availability=0;
	}
	#Add or update lecture
	my $mysqlDate = $data->{CREATED};
	$mysqlDate =~ s/:/-/g;
	$c->log->debug("date: $mysqlDate" );
	my $lecture = $c->model('E_Learning::ElearnDB::lecture')->update_or_create({
		filename => $data->{ID},
		creator => $data->{CREATOR},
		name => $data->{TITLE},
		description => $data->{DESCRIPTION},
		category => $data->{CATEGORY},
		public => $availability,
		created => $mysqlDate,
	});
	
	#Att to the tags and lecture_has_tags table
	for my $tag (@{$data->{TAGS}}){
		my $tags = $c->model('E_Learning::ElearnDB::tags')->update_or_create({
			tag => $tag,
		});
		my $lecture_has_tags = $c->model('E_Learning::ElearnDB::lectureHasTags')->update_or_create({
				tag => $tag,
				lectureid => $data->{ID},
		});
	}
	
	my $chapters = {};
	$chapters = $data->{CHAPTERS};
	for my $title (keys %{$chapters}){	
		for my $time (@{$chapters->{$title}}){
			my @startStop = split(":", $time);
			my $chapter = $c->model('E_Learning::ElearnDB::chapter')->update_or_create({
				chapter => $title,
				lectureid => $data->{ID},
				start => $startStop[0],
				stop => $startStop[1],
			});
		}
	}		
}


=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
