#!/usr/bin/env perl

use strict;
use warnings;
use 5.010;

say("Content-Type: text/html");
say("");
say("Hello, ", $ENV{'QUERY_STRING'})
