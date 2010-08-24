package Elearn::Controller::userData;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::userData - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 getUserData

=cut

sub getUserData :Args(0){
	my ( $self, $c ) = @_;
	my $count = $c->model('ElearnDB::userLectureData')->search({times_watched => {">" ,0}})->count;
	my $created = $c->model('ElearnDB::lecture')->search({creator => $c->stash->{user}} )->count;
	my $answeredQuestions = $c->model('ElearnDB::userQuestionAnswers')->search({user_answered => $c->forward('/getUserName')});
	$c->stash(totalQuestions => $answeredQuestions->count());
	$c->stash(correct => $answeredQuestions->get_column('correct_answer')->sum());
	$c->stash(watched => $count);
	$c->stash(created => $created);
}

=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

