#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

my $filename = "count.txt";
my $count = 0;

sub create_file($) {
    my $file = shift;
    if (! -f $file) {
        open my $fh,">", or die($!);
        print $fh "0";
        close($fh);
    }
}

sub read_count($) {
    my $file = shift;
    open my $fh,"<",$file or die($!);
    while(<$fh>){ $count = $_; }
    close($fh);
}

sub write_file($$) {
    my $file = shift;
    my $count = shift;
    open my $fh,">",$file or die($!);
    print $fh $count;
    close($fh);
}

# create_file($filename);
read_count($filename);
$count += 1;
write_file($filename, $count);

say("Content-Type: text/html");
say("");
say($count);