package Elearn::Controller::E_learning::watch;
use Moose;
use namespace::autoclean;
use List::Util;
use base qw/ Catalyst::Controller /;



BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Video::Controller::watch - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 watch
	Serves the lecture and all information
=cut

sub watch :Chained('/') Args(1){
	my ($self, $c, $id) = @_;
	my $lecture = $c->model('E_Learning::ElearnDB::lecture')->find($id);
	my @tags = $c->model('E_Learning::ElearnDB::lectureHasTags')->search({lectureid => $id});
	my @feedback = $c->model('E_Learning::ElearnDB::feedback')->search({lectureid => $id}, { -order_by => time});
	my @tmp;
	my @feedbackItems;
	for my $row (@tags){
		push(@tmp, $row->tag()->tag());
	}
	for my $row (@feedback){
		push(@feedbackItems, {user => $row->user(), feedback => $row->feedback});
	}
	
	$c->stash(id => $lecture->filename());	
	$c->stash(title => $lecture->name());
	$c->stash(lecturePath => "/LectureData/shared/");
	$c->stash(lecture => $lecture->filename());
	$c->stash(fileExtension => $lecture->filetype() || "flv");
	$c->stash(creator => $lecture->creator() );
	$c->stash(feedback => \@feedbackItems);
	$c->stash(tags => [@tmp]);
	$c->stash(template => 'watch/watch.tt');
	$c->stash(similar => ["Not implemented", "Not implemented","Not implemented","Not implemented"]);
	$c->forward('/e_learning/questions/getLectureQuestions');
}

=head2 
	A lecture has been watcehd an this is recorded in the database
=cut

sub watched :Local Args(1){
	my ($self, $c, $id) = @_;
	my $lecture = $c->model('E_Learning::ElearnDB::lecture')->find($id);
	$lecture->update({times_watched => $lecture->times_watched()+1});
	#Make sure there is a record in the DB for the user and lecture
	my $lecture_data = $c->model('E_Learning::ElearnDB::userLectureData')->update_or_create({
		lecture => $id,
		user => $c->forward('/getUserName'),
	});
	#And uptade the count
	$lecture_data->update({times_watched => $lecture_data->times_watched()+1});
	$c->res->output("200 OK");
}

=head2 rateLecture
	Saves the user rating to the database
=cut
sub rateLecture :Local :Args(2){
	my ($self, $c, $id, $rating) = @_;
	$c->model('E_Learning::ElearnDB::userLectureData')->update_or_create({
		lecture => $id,
		user => $c->forward('/getUserName'),
		rating => $rating,
	});
	$c->res->output("200 OK");
}

=head2 rememberLecture
	Let's the user remeber good lectures so they can be found again
=cut

sub rememberLecture :Local :Args(1){
	my ($self, $c, $id) = @_;
	$c->model('E_Learning::ElearnDB::userLectureData')->update_or_create({
		lecture => $id,
		user => $c->forward('/getUserName'),
		favorite => 1,		
	});
	$c->res->output("200 OK");
}

=head2 addQuestion
	Let the user add a question to a lecture for other students to answer. 
=cut

sub addQuestion :Local :Args(5){
	my ($self, $c, $id, $question, $answer, $alt1, $alt2) = @_;
	$c->model('E_Learning::ElearnDB::lectureQuestions')->update_or_create({
		lecture => $id,
		user => $c->forward($c->uri_for('/getUserName')),
		answer => $answer,
		question => $question,
		alternative1 => $alt1,
		alternative2 => $alt2,
	});
}

=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

