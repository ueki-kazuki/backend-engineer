#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

my ($sec,$min,$hour,$mday,$mon,$year) = localtime;

say("Status: 301 Moved Permanetly");
say("Location: http://www.yahoo.co.jp/");
say("Content-Type: text/html");
say("");
printf("%04d/%02d/%02d %02d:%02d:%02d"
	, $year+1900
	, $mon +1
	, $mday, $hour, $min, $sec);
say("<table>");
foreach my $key (sort keys %ENV) {
	#say("$key = $ENV{$key}")
	#say("<li>$key = $ENV{$key}</li>")
	say("<tr><th>$key</th><td>$ENV{$key}</td></tr>");
}
say("</table>");
