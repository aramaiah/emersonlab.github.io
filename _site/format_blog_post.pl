#!/usr/bin/env perl
use warnings;
use strict;
use Getopt::Long;
use POSIX 'strftime';
print 

my $infile;
my $title;
my $comments = 1;
my $author;
my $authorpage;
my $date = POSIX::strftime("%Y-%m-%d %I:%M:%S%p %z\n", localtime);
#GetOptions ("infile=i" => \$infile,    # numeric
#	"title=t"   => \$title,      # string
#	"title=t"   => \$title,      # string
#	"title=t"   => \$title,      # string
#	"title=t"   => \$title,      # string
#	or die("Error in command line arguments\n");

