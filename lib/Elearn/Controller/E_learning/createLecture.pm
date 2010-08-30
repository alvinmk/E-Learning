package Elearn::Controller::E_learning::createLecture;
use Moose;
use File::HomeDir qw(home);
use namespace::autoclean;

my $createdLecturePath = File::HomeDir->my_home."/Video/Webcam";

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::E_learningcreateLecture - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut

=head2
	#Launches gnome cheese and then let's the user choose to continue
=cut
sub startRecording : Local Args(0){
	my ($self, $c) = @_;
}


=head2
	Goes through the gnome cheese folder and displays all video clips for the user

	Find all the files in the gnome cheese folder, ~/Video/Webcam
	List them by date
	There should be some way of viewing them, probably in an external player
	The user chooses a video and in the background it starts to be encoded
=cut

sub ListRecordings : Local Args(0){
	my ($self, $c) = @_;
	opendir (DIR, $createdLecturePath);
	$c->log->debug($createdLecturePath);
   my @dir = readdir(DIR);


	$c->log->debug("$dir[1]");
	closedir(DIR);
   @dir = sort { -M "$createdLecturePath/$a" <=> -M "$createdLecturePath/$b" } (@dir); #perl magic, sorts by modification time
	#In unix everything is a file, so the current directory and the top level are stored as files. Or so it seems
	shift @dir;
	shift @dir;
	
	$c->stash(files => \@dir);
   

} 

=head2
	When the user has made their choice the result is submitted to this functions which encodes it to flash
=cut
sub chooseRecordings : Local Args(1){
	my ($self, $c) = @_;
}


=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

