package Alien::Boost::Helper;

use strict;
use warnings;
use utf8;

use File::Spec::Functions qw(catfile catdir);
use File::Copy;
use File::Copy::Recursive;

sub main::build {
   if ($^O eq 'MSWin32') {
       system("bootstrap.bat gcc");
       system("b2 toolset=gcc --build-type=complete stage");
   } else {
       system("./bootstrap.sh");
       system("./b2");
   }
}

sub main::install {
    my $dir = $ARGV[0];

    my $headers_folder = "boost";
    my $stage_folder = "stage";

    my $dst_headers_folder = catdir($dir, 'include');
    move $headers_folder, $dst_headers_folder;
    move catdir($stage_folder, 'lib'), $dir;
}

1;
