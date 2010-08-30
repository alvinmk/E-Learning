package Elearn::View::E_learning::E_LearningTT;

use strict;
use warnings;

use base 'Catalyst::View::TT';

__PACKAGE__->config(
    TEMPLATE_EXTENSION => '.tt',
    INCLUDE_PATH => [Elearn->path_to( 'root', 'E_learning' ),],
	WRAPPER => 'E_learning_wrapper.tt',
);

=head1 NAME

Elearn::View::E_learning::TT - TT View for Video

=head1 DESCRIPTION

TT View for Elearning.

=head1 SEE ALSO

L<Elearn>

=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

1;
