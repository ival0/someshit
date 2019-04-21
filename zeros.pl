#/usr/bin/perl

use strict;
use warnings;
my $number = "00012000";
$number =~s/\b0*//;
print "$number\n";