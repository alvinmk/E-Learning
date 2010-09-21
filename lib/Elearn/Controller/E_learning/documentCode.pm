package Elearn::Controller::E_learning::documentCode;
use Moose;
use namespace::autoclean;
use SQL::Translator;

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
		data          => $c->model('E_Learning::ElearnDB')->schema,
		producer      => 'Diagram',
		producer_args => {
			output_type => 'png',
			title       => 'Elearning Schema',
		},
	)or die SQL::Translator->error;
	$c->res->content_type('image/png');
	$c->res->body( $translator->translate );
}

sub methods : Local :Args(1){
	my ( $self, $c, $controller ) = @_;
	open(FILE, "<lib/Elearn/Controller/E_learning/$controller.pm") or die;
	my %methodContent; #Here be crazy datastructures, hash of hash of list
	my $methodName="unkown";
	my @methodNames;

	my $input;
	while (<FILE>){
		#Get method name followed by dispatcher and arguments sub NAME : DISPATCH ARGS(X)	
		if($_ =~ m/^sub\s(.*)\s+:\s*(.*)\s+(.*){.*$/){
			$methodName = $1;
			my $dispatch = $2;
			my $numberOfArguments = "0";
			my $args = $3;
			my $dispatchPath;
			if($dispatch =~ m/'(.*)'/){ #get path from chained
				$dispatchPath = $1;
				if($dispatchPath ne '/'){
					$dispatchPath = $dispatchPath."/"; #Add a / to the end of the chain so that it looks pretty
				}
			}
			else{ #If its not chained take the whole thing
				$dispatchPath = "$dispatch ";
			}
			if($args =~ m/\((.*)\)/){ #Get number of input arguments from args, (Capture)Args(THIS TEXT)
				$numberOfArguments = $1;
				if($1 eq ""){ #No number of arguments given
					$numberOfArguments = "Any";
				}
			}
			$methodContent{$methodName} = {path => $dispatchPath, name=> $methodName, nrArgs => $numberOfArguments};
			push(@methodNames, $methodName);
		}
		elsif($_ =~ m/stash\((.*)\);/){ #catch "stash(THIS TEXT);"
			push(@{$methodContent{$methodName}{"stash"}}, $1);	
		}
		elsif($_ =~ m/forward\(('|")(.*)('|")\)/){ #catch "forward(THIS TEXT)"
			push(@{$methodContent{$methodName}{"calls"}}, $2);	
		}
		elsif($_ =~ m/detach\(('|")(.*)('|")\)/){ #catch "detach(THIS TEXT);"
			push(@{$methodContent{$methodName}{"calls"}}, $1);	
		}
		elsif($_ =~ m/model\('.*::(.*)'\)-\>(search|find)\({(.*)}\)(->(.*))*/){ #catch "model(ELEARN::...::THIS)->search/find(THIS);"
			push(@{$methodContent{$methodName}{model}}, "$1 [$3] $5");	
		}
		elsif($_ =~ m/my\s\(\$self,\s\$c,\s(.*)\)/){ #Input arguments my ($self, $, THIS)
			push(@{$methodContent{$methodName}{"input"}}, $1);	
		}
		elsif($_ =~ m/-\>upload\((.*)\)/){
			push(@{$methodContent{$methodName}{"input"}}, "Form arguments: $1");	
		}
	}
	close FILE;
	$c->stash(class =>$controller);
	$c->stash(methodContent => \%methodContent);
	$c->stash(methodNames => \@methodNames);	
	$c->stash(template => "documentcode/methods.tt");
}

=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

