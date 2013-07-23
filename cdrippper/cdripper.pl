#!/usr/bin/perl

use CDDB;
use CDDB_get;

my $cddbp = new CDDB(
	Host => 'freedb.freedb.org',
	Port => 8880,
	Loing => $login_id,
) or die "Could not install CDDB connection to freebd $!";

 use CDDB_get qw( get_cddb );

 # rip cd
 system("cdparanoia -B --");

 my %config;

 # following variables just need to be declared if different from defaults

 $config{CDDB_HOST}="freedb.freedb.org";        # set cddb host
 $config{CDDB_PORT}=8880;                       # set cddb port
 $config{CDDB_MODE}="cddb";                     # set cddb mode: cddb or http
 $config{CD_DEVICE}="/dev/cdrom";               # set cd device

 # user interaction welcome?

 $config{input}=1;   # 1: ask user if more than one possibility
                     # 0: no user interaction

 # get it on

 my %cd=get_cddb(\%config);

 unless(defined $cd{title}) {
   die "no cddb entry found";
 }

 # do somthing with the results

 print "artist: $cd{artist}\n";
 print "title: $cd{title}\n";
 print "category: $cd{cat}\n";
 print "cddbid: $cd{id}\n";
 print "trackno: $cd{tno}\n";

 my $n=1;
 foreach my $i ( @{$cd{track}} ) {
   print "track $n: $i\n";

  my $trackname = "";

  while ($i =~ /(\w+)/g) { $trackname .= $1; };  
  print $trackname;
  if ($n < 10) {
   system("oggenc -o $n$trackname" . ".ogg track0" . "$n" . ".cdda.wav"); 
  } else {
   system("oggenc -o $n$trackname" . ".ogg track" . "$n" . ".cdda.wav");
  }
  $n++;
 }

1;
