package Elearn::Controller::help;
use Moose;
use namespace::autoclean;
use URI::Escape;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::help - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 help

=cut

sub help :Path :Args(0) {
   my ( $self, $c ) = @_;
	my $referer = uri_unescape($c->request->referer);
	my $base = $c->request->base;
	$referer =~ s/$base//;
	$c->log->debug("Referer: $referer");
	my @args = split /\//, $referer;
	$c->forward("whatHelp", \@args); 
}

sub whatHelp :Action {
	my ( $self, $c , $page, $subpage, @rest) = @_;
	$c->log->info("$page, $subpage,$rest[0]");
	$c->stash(help => "$subpage in $page and there was maybe some arguments like: $rest[0], $rest[1] ");
}


=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

