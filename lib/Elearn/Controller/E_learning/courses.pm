package Elearn::Controller::E_learning::courses;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::E_learningcourses - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 ListCourses

=cut

sub listCourses :Chained('/') Args(1){
	my ($self, $c, $argument) = @_;
	my @courses;
	my @results;
	if($argument eq "all"){
		@courses = $c->model('E_Learning::ElearnDB::courses')->search({});
		$c->log->debug("Matched 'all'");
	}
	for my $course (@courses){
		$c->log->debug("name ".$course->course_name());
		push(@results, {course_name => $course->course_name(), description => $course->description()});
	}
	$c->stash(courses => \@results);
	$c->stash(template => 'courses/listCourses.tt');
}

sub getCourseLectures :Chained('/') Args(1){
	my ($self, $c, $courseName) = @_;
	my	@course = $c->model('E_Learning::ElearnDB::courseModule')->search({course_name => $courseName});
	my @results;
	for my $id (@course){
		my $lecture = $c->model('E_Learning::ElearnDB::lecture')->find({filename => $id->lecture()->filename()});
		$c->log->debug("found lecture ".$lecture->name());
		push(@results, {name => $lecture->name(), id => $lecture->id(), description => $lecture->description()} );
	}

	$c->stash(list => \@results);
	$c->stash(header => "$courseName course");	
	$c->stash(template =>'search/list.tt');
}


=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

