#! /usr/bin/perl -w

use File::Find;

$dir = "./lib";

find(\&edits, $dir);

sub edits() {
	if($_ =~ m/.pm$/){
		print "Filepath is $File::Find::name\n";
		#Now when the file is found, change the package
	}
	
}
