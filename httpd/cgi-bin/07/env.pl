#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

say("Content-Type: text/plain");
say("");
foreach my $key (sort keys %ENV) {
	say("$key = $ENV{$key}")
}
