#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

my $q;
read(STDIN, $q, $ENV{'CONTENT_LENGTH'});
my @fields = split("&", $q);
my %pairs  = {};
for my $field (@fields) {
    my($key, $value) = split("=", $field);
    $pairs{$key} = $value;
}

my ($sec,$min,$hour,$mday,$mon,$year) = localtime;


say("Content-Type: text/html");
say("");
say("<b>", $pairs{'yourname'}, "</b>");
say("<p>", $pairs{'message'}, "</p>");
say("</p>");
printf("<p>%04d/%02d/%02d %02d:%02d:%02d</p>"
	, $year+1900
	, $mon +1
	, $mday, $hour, $min, $sec);