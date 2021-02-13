#!/usr/bin/env perl

use strict;
use warnings;

print("Content-Type: text/plain\n");
print("\n");
foreach my $key (sort keys %ENV) {
	print("$key = $ENV{$key}\n")
}
