#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;
use FindBin;
use Fcntl qw(:flock);

my $filename = $FindBin::Bin . "/../count.txt";
my $count = 0;

open my $fh,"+<",$filename or die($!);
flock $fh, LOCK_EX or die "Unable to lock file $!";
while(<$fh>){ $count = $_; }
# sleep(10) if $count == 0;
$count += 1;
seek $fh, 0, 0;
truncate $fh, 0;
print $fh $count;
close($fh);

say("Content-Type: text/html; charset=utf-8");
say("");
say("あなたは", $count, "人目のお客様です");
