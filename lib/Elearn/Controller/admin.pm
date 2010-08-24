package Elearn::Controller::admin;
use Moose;
use namespace::autoclean;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::admin - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

sub adminView :Chained('/') :Args(1){
	my ( $self, $c, $id ) = @_;
	$c->stash(adminView => "<form><input type='button' name='Edit' value='Edit' onClick=window.location.href='/edit/'+videoID></form>");
	$c->stash(recomend => "<input type='button' name='recomend' value='recomend' onClick='recomend()'>");
	$c->forward("/watch/watch",$id);
}

sub recomendLecture : Local Args(1){
	my ($self, $c, $id) = @_;
	my $lecture = $c->model('ElearnDB::lecture')->find($id);
	$lecture->update({recomended => 1});
	$c->res->output("200 OK");
}

=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

