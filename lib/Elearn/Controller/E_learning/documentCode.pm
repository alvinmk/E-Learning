package Elearn::Controller::E_learning::documentCode;
use Moose;
use namespace::autoclean;
use SQL::Translator;
use Template::AsGraph;
#use CatalystX::Dispatcher::AsGraph;

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::E_learningdocumentCode - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2 schema
	Generates a database schema and outputs it to the user
=cut

sub schema : Local {
	my ( $self, $c ) = @_;
	my $translator = SQL::Translator->new(
		parser        => 'SQL::Translator::Parser::DBIx::Class',
		data          => $c->model('ElearnDB')->schema,
		producer      => 'Diagram',
		producer_args => {
			output_type => 'png',
			title       => 'Elearning Schema',
		},
	)or die SQL::Translator->error;
	$c->res->content_type('image/png');
	$c->res->body( $translator->translate );
}

sub actionGraph : Local {
	my ( $self, $c ) = @_;
	my $graph = CatalystX::Dispatcher::AsGraph->new(
   	  appname => 'Elearn',
	     output  => 'myactions.png',
	);
	$graph->run;
	if ( open( my $png, '|-', 'dot -Tpng -o ' . $graph->output ) ) {
	   print $png $graph->graph->as_graphviz;

		$c->res->content_type('text/html');
		$c->res->body( "done");
	   close $png;
	}
}
=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

