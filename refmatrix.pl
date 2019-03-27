#/usr/bin/perl

use strict;
use warnings;

my $matrix_range;
my $i;
my $j;
my $Bufer;
my $file_name = "matrix.dat";
my @matrix;
my $ref_matrix=\@matrix; 
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
while (!eof){
  my $line=readline($fh);
  chomp($line);
  push @matrix, [split( /\t/, $line)];
  $matrix_range++;
}
$matrix_range--;
close $fh;
for $i (0..$matrix_range){
  for $j (0..$matrix_range){
    print "$ref_matrix->[$i][$j]"."|";
  }
  print "\n";
}
print "was 2 for\n";
   
for $i(0..$matrix_range-1) {
  for $j($i+1..$matrix_range){
    $Bufer=$ref_matrix->[$i][$j];
    $ref_matrix->[$i][$j]=$ref_matrix->[$j][$i];
    $ref_matrix->[$j][$i]=$Bufer;
  }
}
for $i(0..$matrix_range) {
  for $j(0..$matrix_range) {
    print "$ref_matrix->[$i][$j]"."|";
  }
  print "\n";
}
