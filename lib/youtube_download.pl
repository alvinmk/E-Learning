use File::Copy;
use Archive::Tar;
use File::HomeDir qw(home);
use Gtk2::Notify -init, "YFRHW";
$home = File::HomeDir->my_home;


print "$dir\n";


my $id = shift;
my $title =shift;
my $source = shift;
my $availability = shift;
$dir="$home/Perl/Elearn/root/LectureData";
if($source == "youtube"){
	system("youtube-dl -c -b -o $dir/temp/$id.flv http://www.youtube.com/watch?v=$id");
}

if($availability == "shared"){
	
	#Change this before deployment
	chdir("$dir/temp/");#Go up to temp
	my $tar = Archive::Tar->new;
	$tar->add_files("$id.flv","$id.yml");
	chdir("../../..");#Aaaand back down down
	$tar->write("$home/Perl/Elearn/root/_OUT/$id.tgz",COMPRESS_GZIP);
	#Move from temp cataloge
	move("$dir/temp/$id.flv", "$dir/shared/$id.flv");
	move("$dir/temp/$id.yml", "$dir/shared/$id.yml");
	#Upload to server
	#system("scp ~/Perl/Elearn/root/_OUT/$id.tgz media\@10.48.19.128:lectures/$id.tgz"); 
	
	#$scp = Net::SCP->new( "10.48.19.128:lectures", "media" );

}
else
{
	move("$dir/temp/$id.flv", "$dir/private/$id.flv");
	move("$dir/temp/$id.yml", "$dir/private/$id.yml");
}

my $notification = Gtk2::Notify->new("YTFRHW", "$title finished downloading");
$notification->show;
