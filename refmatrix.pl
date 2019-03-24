#/usr/bin/perl

use strict;
use warnings;

my $i;
my $j;
my $Bufer;
my $ref_matrix=[
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25]
      ];
for $i(0..3) {
  for $j($i+1..4){
    $Bufer=${$ref_matrix}->[$i][$j];
    ${$ref_matrix}->[$i][$j]=${$ref_matrix}->[$j][$i];
    ${$ref_matrix}->[$j][$i]=$Bufer;
  }
}
for $i(0..4) {
  for $j(0..4) {
    print "${$ref_matrix}->[$i][$j]"." ";
  }
  print "\n";
}
