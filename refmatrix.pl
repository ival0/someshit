#/usr/bin/perl

use strict;
use warnings;

my $matrix_range;
my $i;
my $j;
my $Bufer;
my $file_name = "matrix.dat";
my @matrix;
unless ( defined $file_name ) {
    die "No argument!";
}

unless ( -e $file_name ) {

  die "No such file: '$file_name'!";
}

unless ( -r $file_name ) {

  die "No read access to file: '$file_name'!";
}

exit(0) if -z $file_name;

open( my $fh, "$file_name" ) or die "Can't open '$file_name'!\n";
$matrix_range=0;
print "file opened\n";
while (!eof){
  my $line=$fh;
  chomp($line);
  print "$line\n";
  @matrix[$matrix_range]=split( '\t', $line);
  $matrix_range++;
}
close $fh;
print "file closed";
foreach $i (@matrix){
  print "$i\n";
}
#@matrix=[
#      [1, 2, 3, 4, 5],
#      [6, 7, 8, 9, 10],
#      [11, 12, 13, 14, 15],
#      [16, 17, 18, 19, 20],
#      [21, 22, 23, 24, 25]
#      ];
my $ref_matrix=\@matrix;  
   
for $i(0..$matrix_range-1) {
  for $j($i+1..$matrix_range){
    $Bufer=$ref_matrix->[$i][$j];
    $ref_matrix->[$i][$j]=$ref_matrix->[$j][$i];
    $ref_matrix->[$j][$i]=$Bufer;
  }
}
#for $i(0..4) {
#  for $j(0..4) {
#    print "$ref_matrix->[$i][$j]"." ";
#  }
#  print "\n";
#}
