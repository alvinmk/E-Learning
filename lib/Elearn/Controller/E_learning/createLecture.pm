package Elearn::Controller::E_learning::createLecture;
use Moose;
use File::HomeDir qw(home);
use namespace::autoclean;
use Gtk2::Notify -init, "YFRHW";
use File::Copy;

my $createdLecturePath = File::HomeDir->my_home."/Video/Webcam"; #The directory where gnome cheese store recoreded material

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
sub startCheese : Local Args(0){
	my ($self, $c) = @_;
	system("cheese"); #Blocking, no redirect until the program closes, if this is run as a server and not a local application things will get strange
	#When the user closes the program detach and list the new recording
	$c->detach('listVideos'); 
}


=head2
	Goes through the gnome cheese folder and displays all video clips for the user

	Find all the files in the gnome cheese folder, ~/Video/Webcam
	List them by date
	There should be some way of viewing them, probably in an external player
	The user chooses a video and in the background it starts to be encoded
=cut

sub listVideos : Local Args(0){
	my ($self, $c) = @_;
	opendir (DIR, $createdLecturePath);
	$c->log->debug($createdLecturePath);
   my @dir = readdir(DIR);
	closedir(DIR);
   @dir = sort { -M "$createdLecturePath/$a" <=> -M "$createdLecturePath/$b" } (@dir); #perl magic, sorts by modification time
	#Check that all files are video files and store them in a new list
	my @results;
	for my $file (@dir){
		if( $file =~ m/(.flv)|(.avi)|(.mkv)|(.ogv)|(.ogg)|(mpg)/i){ #check if the file contains a file ending and ignore case
			push(@results, $file);
		}
	}
	$c->stash(files => \@results);
   $c->stash(template => 'createlecture/listRecording.tt');
}

=head2
	launches a video in an external video player
=cut

sub playVideoInExternalPlayer : Local Args(1){
	my ($self, $c, $userfile) = @_;
	system("vlc '$createdLecturePath/$userfile'"); #Launches vlc through the command line
	$c->detach('listVideos');
}

=head2
	When the user has made their choice the result is submitted to this functions which encodes it to flash
=cut
sub chooseVideo : Local Args(){
	my ($self, $c, $userfile, $path) = @_;
	$c->log->info($userfile);
	#If no path is defined use the default path
	if(!defined $path){
		$path=$createdLecturePath;
	}
	$c->log->debug("The path for the video file is $path");
	#Encode to flash in separate process
	#Child process	
	my $filename = $userfile;
	$filename =~ s/(\..+)$//;
	#Chech that it's not already a flv file
	if($1 ne ".flv"){
		my $child = fork;
		if($child == 0){
			$SIG{INT}='DEFAULT';	
			my $args =("ffmpeg -i '$path/$userfile' -ar 22050 -f flv -s 640x480 -y root/LectureData/shared/$filename.flv");
			system($args);
			my $notification = Gtk2::Notify->new("Encoding finished", "The encoding of your video: $userfile is now finsihed. You can now watch the lecture");
			exit(0);
		}
		#Parent process
		else{
			#do nothing
		}
	}
	else{
		$c->log->debug("Copying $path/$userfile to root/LectureData/shared/$filename.flv");
		copy("$path/$userfile","root/LectureData/shared/$filename.flv");
	}
	#add to database
	my $lecture = $c->model('E_Learning::ElearnDB::lecture')->update_or_create({
		filename => $filename,
		filetype => "flv",
		creator => $c->forward('Elearn::Controller::E_learning::Root', 'getUserName'),
		category => "general" #must be set for foreign key
	});
	#forward to edit view
	$c->detach("Elearn::Controller::E_learning::edit", "edit", [$filename]);
}
=head2
	Let the user specify a file in another location, copy it to the temp directory and then let the chooseCheeseVideo function encode them and add them to the database.
=cut

sub chooseVideoFile : Local Args(0){
	my ($self, $c) = @_;
	my $userfile = $c->request->params->{file};
	if( $userfile =~ m/(.flv)|(.avi)|(.mkv)|(.ogv)|(.ogg)|(mpg)/i){
		my $upload = $c->request->upload('file');
		$upload->copy_to("root/LectureData/temp/$userfile");
		$c->detach("chooseVideo", [$userfile, "/root/LectureData/temp/"]);
	}
	#If it's another filetype
	else {

	}
}

=head2

=cut

sub chooseOtherFile : Local Args(1){
	my ($self, $c, $userfile) = @_;
}


=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

