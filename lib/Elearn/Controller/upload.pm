package Elearn::Controller::upload;
use Moose;
use namespace::autoclean;
use WWW::Mechanize;
use JSON;
use YAML::XS;
use File::Copy;
use File::Basename;
use File::HomeDir qw(home);

my $home    = File::HomeDir->my_home;
my $path = "$home/Perl/Elearn/root/LectureData/temp";

BEGIN {extends 'Catalyst::Controller'; }

=head1 NAME

Elearn::Controller::upload - Catalyst Controller

=head1 DESCRIPTION

Catalyst Controller.

=head1 METHODS

=cut


=head2 

Upload start

=cut

sub upload :Chained('/') :Args(0){
	my ($self, $c) = @_;
	$c->stash(template => 'upload/upload_form.tt');

}

=head2

A local file was selected, upload, encode and put on page.

=cut

sub localUpload :Local Args(0){
	my ($self, $c) = @_;
	for my $field ( $c->request->upload  ) {
		my $upload = $c->request->upload($field);
		my $name = basename($upload->tempname);
		$c->log->debug($name);
		$upload->copy_to("$path/$name.flv");
		#Send back javascript to the hidden iframe for the client to execute
		$c->res->header('Content-Type' => 'text/html');
		$c->res->output("<script language='javascript' type='text/javascript' >window.parent.stopUpload('$name.flv');</script>");
	}
	
}

=head2

Edit a video, get data from database and fill it into the form

=cut

sub edit :Chained('/') :Args(1){
	my ($self, $c, $id) = @_;
	my $lecture = $c->model('ElearnDB::lecture')->find($id);
	my @tags = $c->model('ElearnDB::lectureHasTags')->search({lectureid => $id});
	my @tmp;
	for my $field (@tags){
		push(@tmp, $field->tag()->tag());
	}
	my @chapterData;
	my @chapters = $c->model('ElearnDB::chapter')->search({lectureid => $id});
	for my $field (@chapters){
		$c->log->debug($field->start()."->".$field->stop().":".$field->chapter());
		push(@chapterData, $field->start()."->".$field->stop().":".$field->chapter());
	}
	$c->stash(description => $lecture->description());
	$c->stash(title => $lecture->name());
	$c->stash(lecturePath => "/LectureData/shared/");
	$c->stash(lecture => $lecture->filename());
	$c->stash(fileExtension => ".flv");
	$c->stash(creator => $lecture->creator() );
	$c->stash(tags => [@tmp]);
	$c->stash(chapters => [@chapterData]);
	$c->stash(id => $lecture->filename());
	$c->stash(template => 'upload/edit.tt');
}

=head2 editDone
	Takes the data from the form and updates the database
=cut

sub editDone :Local :Args(0){
	my ($self, $c) = @_;
	my $title = $c->request->params->{title}     || 'N/A';
	my $description    = $c->request->params->{description}    || 'N/A';
	my $category = $c->request->params->{category} || 'N/A';
	my $availability = $c->request->params->{availability} || 'N/A';
	my $videoID = $c->request->params->{id} || 'N/A';
	my @tags = split(',', ($c->request->params->{tags} || 'N/A') );
	my @chapterList = split(',', ($c->request->params->{chapters} || 'N/A') );
	my $chapters ={};
	#Take all start->stop:chapter and store them with chapter as non unique key
	for my $value (@chapterList){
		if($value =~ /->/)
		{
			$value =~s/^\s+|\s+$//g; #Strip whitespaces from array elements
			$c->log->debug($value);
			my @tmp = split(':', $value); #Time and chapter in separate indices
			$tmp[0] =~ m/(.*)->(.*)/; #Get times
			push( @{$chapters->{$tmp[1]}}, "$1:$2" );
		}
	}
	my @tmp;
	for my $tag (@tags){
		$tag =~s/^\s+|\s+$//g; #Strip whitespaces from array elements
		if($tag ne ""){
			push(@tmp, $tag);
		}
	}
	@tags = @tmp;
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
	$year+=1900; #Get year in a meaningful format
	my $data = {
		ID => $videoID,
		TITLE => $title,
		DESCRIPTION => $description,
		CREATOR => $c->forward('/getUserName'),
		TAGS => [@tags],
		CHAPTERS => $chapters,
		CATEGORY => $category,
		AVAILABILITY => $availability,
		CREATED => "$year-$mon-$mday", #Store it in the same format as mysql
	};
	#Remove chapters and tags for lecture
	$c->model('ElearnDB::lectureHasTags')->search({ lectureid => $videoID})->delete_all();
	$c->model('ElearnDB::chapter')->search({ lectureid => $videoID})->delete_all();
	#Update database
	$c->forward('addToDB', [$data]);
	$c->response->redirect("/watch/$videoID");
}

=head2 

Youtube link submitted, extract video and information.
Then use AJAX to fill in the fields to make it easier for the user

=cut

sub link :Local Args(0){
	my ($self, $c) = @_;
	my $videoID;
	my $json;

	my $link = $c->request->params->{link};
	$link =~ m/=(.*)/;
	$videoID = $1;
	# Get youtube metadata from
	# http://gdata.youtube.com/feeds/api/videos/videoID
	# Then parse it	
	my $url = "http://gdata.youtube.com/feeds/api/videos/$videoID";
	my $m = WWW::Mechanize->new();
	$m->get($url);
	my $youtubeData = $m->content;
	$youtubeData =~ m{<title type=\'text\'>(.*)</title>};
	my $title = $1;
	$youtubeData =~ m{<media:keywords>(.*)</media:keywords>};
	my $tags = $1;
	$youtubeData =~ m{<media:description type=\'plain\'>(.*)</media:description>};
	my $description = $1;
   	$c->log->debug("Title $title\nKeywords $tags\nDescription $description");
   	
   #Gather all the responses
	#Put them into JSOn
	$json->{"youtubeID"} = $videoID;
	$json->{"tags"} = $tags;
	$json->{"title"} = $title;
   $json->{"description"} = $description;

	my $json_text = to_json($json);
	#And send the response
	$c->res->header('application/json');
	$c->res->output($json_text);
}

=head2

Recive the video data and save it for upload to the server

=cut

sub add_video :Local :Args(0){
	my ($self, $c) = @_;
	my $title    = $c->request->params->{title}     || 'N/A';
	my $description    = $c->request->params->{description}    || 'N/A';
	my $category = $c->request->params->{category} || 'N/A';
	my $availability = $c->request->params->{availability} || 'N/A';
	my @tags = split(',', ($c->request->params->{tags} || 'N/A') );
	my $link = $c->request->params->{link};
	my @timestamps = split(',', ($c->request->params->{timestamps} || 'N/A') );
	my $videoID;
	my $source;
	if($link =~ m/www\.you/){
		$link =~ m/=(.*?)(&|$)/;
		$videoID = $1;
		$source="youtube";
	}
	else
	{
		$source="local";
		$link =~ m/^(.*?)\./;
		$videoID=$1;
	}
	$c->log->debug($videoID);

	for(@tags)
	{
		s/^\s+|\s+$//g; #Strip whitespaces from array elements
	}
	
	
	my $chapters ={};
	#Take all start->stop:chapter and store them with chapter as non unique key
	for my $value (@timestamps){
		if($value =~ /->/)
		{
			$value =~s/^\s+|\s+$//g; #Strip whitespaces from array elements
			$c->log->debug($value);
			my @tmp = split(':', $value); #Time and chapter in separate indices
			$tmp[0] =~ m/(.*)->(.*)/; #Get times
			push( @{$chapters->{$tmp[1]}}, "$1:$2" );
		}
	}
	my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
	$year+=1900; #Get year in a meaningful format
	my $data = {
		ID => $videoID,
		TITLE => $title,
		DESCRIPTION => $description,
		CREATOR => $c->forward('/getUserName'),
		TAGS => [@tags],
		CHAPTERS => $chapters,
		CATEGORY => $category,
		AVAILABILITY => $availability,
		CREATED => "$year-$mon-$mday", #Store it in the same format as mysql
	};
	my $yaml = Dump $data;
	#Save to a yaml file
	open(MYFILE, ">$path/$videoID.yml") or die $!;
	print MYFILE $yaml;
	close(MYFILE); 

	$c->forward('addToDB', [$data]);
	$c->response->redirect("/watch/$videoID");
	#Download the video in a separate process
	my $child = fork;
	#Child process	
	if($child == 0){
		$SIG{INT}='DEFAULT';	
		my @args =("perl", "$home/Perl/Elearn/lib/youtube_download.pl", "$videoID", "$title", "$source", "$availability", "| tee ", "$home/Perl/Elearn/log");
		exec(@args);
		exit(0);
	}
	#Parent process
	else{	
	}
}

=head2
	Add to database
=cut

sub addToDB :Private{
	my ($self, $c, $data) = @_;
	my $availability;
	$c->log->debug("ADDING VIDEO TO DATABASE");
	if($data->{AVAILABILITY} eq "public"){
		$availability=1;
	}
	else{
		$availability=0;
	}
	#Add or update lecture
	my $mysqlDate = $data->{CREATED};
	$mysqlDate =~ s/:/-/g;
	$c->log->debug("date: $mysqlDate" );
	my $lecture = $c->model('ElearnDB::lecture')->update_or_create({
		filename => $data->{ID},
		creator => $data->{CREATOR},
		name => $data->{TITLE},
		description => $data->{DESCRIPTION},
		category => $data->{CATEGORY},
		public => $availability,
		created => $mysqlDate,
	});
	
	#Att to the tags and lecture_has_tags table
	for my $tag (@{$data->{TAGS}}){
		my $tags = $c->model('ElearnDB::tags')->update_or_create({
			tag => $tag,
		});
		my $lecture_has_tags = $c->model('ElearnDB::lectureHasTags')->update_or_create({
				tag => $tag,
				lectureid => $data->{ID},
		});
	}
	
	my $chapters = {};
	$chapters = $data->{CHAPTERS};
	for my $title (keys %{$chapters}){	
		for my $time (@{$chapters->{$title}}){
			my @startStop = split(":", $time);
			my $chapter = $c->model('ElearnDB::chapter')->update_or_create({
				chapter => $title,
				lectureid => $data->{ID},
				start => $startStop[0],
				stop => $startStop[1],
			});
		}
	}		
}



=head2 submitFeedback

=cut
sub submitFeedback :Chained('/') :Args(0){
	my ($self, $c) = @_;
	my $feedback = $c->request->params->{feedback} || 'N/A';
	my $lectureid = $c->request->params->{lectureid} || 'N/A';
	my $feedbackItem = $c->model('ElearnDB::feedback')->update_or_create({
		lectureid => $lectureid,
		user => $c->forward('/getUserName'),
		feedback => $feedback,
	});
	$c->response->redirect("/watch/$lectureid");	

}

=head2 import 
Import from directory the imprt directory, looks for yaml files, load them and import the callin addToDB
Then removes the yaml file and moves the flv file to the shared directory
=cut
sub import :Chained('/') :Args(0){
	my ($self, $c) = @_;
	my $id;
	opendir(DIR, "$home/Perl/Elearn/root/LectureData/import");
	my @files = grep(/\.yml$/,readdir(DIR));
	foreach my $file (@files){
		$c->log->debug("Importing $file");
		open(FH, "<$home/Perl/Elearn/root/LectureData/import/$file"); 
		my $yml = do { local $/; <FH> };
		my $data = Load($yml);	
		$id=$data->{ID};
		$c->forward('addToDB', [$data]);
		close(FH);
		#Move video to the shared folder and remove the yml file
		move("$home/Perl/Elearn/root/LectureData/import/".$data->{ID}.".flv", "$home/Perl/Elearn/root/LectureData/shared/".$data->{ID}.".flv");
		unlink("$home/Perl/Elearn/root/LectureData/import/$file");
	}
	closedir(DIR);
	
	$c->response->redirect('/list');
}

=head1 AUTHOR

Alvin,,,

=head1 LICENSE

This library is free software. You can redistribute it and/or modify
it under the same terms as Perl itself.

=cut

__PACKAGE__->meta->make_immutable;

1;
