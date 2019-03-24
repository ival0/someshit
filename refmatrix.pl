#/usr/bin/perl

use strict;
use warnings;

my $rmatrix;
my $i;
my $j;
my $Bufer;
@{$rmatrix}=(
      [1, 2, 3, 4, 5],
      [6, 7, 8, 9, 10],
      [11, 12, 13, 14, 15],
      [16, 17, 18, 19, 20],
      [21, 22, 23, 24, 25]
      );
#
#unless ( defined "matrix.dat" ) {
#    die "No argument!";
#}
#
#unless ( -e "matrix.dat" ) {
#
#  die "No such file: matrix.dat!";
#}
#
#unless ( -r "matrix.dat" ) {
#
#  die "No read access to file: matrix.dat!";
#}
#
#exit(0) if -z "matrix.dat";
#
#open( my $fh, "matrix.dat" ) or die "Can't open matrix.dat!\n";
#while (!eof($fh)) {
#  @{$matrix}=[$fh];
# 
# }
for ($i=0; $i<=3; $i++) {
  for ($j=$i+1; $j<=4; $j++){
    $Bufer=${$rmatirx}[$i][$j];
    ${$rmatirx}[$i][$j]=${$rmatirx}[$j][$i];
    ${$rmatirx}[$j][$i]=$Bufer;
  };
};
for ($i=0; $i<=4; $i++) {
  for ($j=0; $j<=4; $j++) {
    print "${$rmatirx}[$i][$j]"." ";
  };
  print "\n";
}
