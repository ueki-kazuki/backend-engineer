#!/usr/local/bin/perl

use strict;
use warnings;
use 5.010;

my ($sec,$min,$hour,$mday,$mon,$year) = localtime;

say "Content-Type: text/html; charset=utf-8";
say "";
say "きょうは";
say sprintf("%04d/%02d/%02d %02d:%02d:%02d"
          , $year+1900
          , $mon +1
          , $mday, $hour, $min, $sec);
say "です";
