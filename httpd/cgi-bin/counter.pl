#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;
use FindBin;

my $filename = $FindBin::Bin . "/../count.txt";
my $count = 0;

open my $fh,"+<",$filename or die($!);
while(<$fh>){ $count = $_; }
# sleep(10) if $count == 0;
$count += 1;
seek $fh, 0, 0;
truncate $fh, 0;
print $fh $count;
close($fh);

say("Content-Type: text/html");
say("");
say($count);