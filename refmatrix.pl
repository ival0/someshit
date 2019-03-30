#/usr/bin/perl

use strict;
use warnings;

my $i;
my $j;
my $Bufer;
my $file_name = "matrix.dat";
my @matrix;
my $ref_matrix=\@matrix;
my @Zero_row;
my $ref_zero_row=\@Zero_row;
my $rows;
my $columns;
#sub trasperense(my $rows, my $columns, my $refs){

#}
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
while (!eof){
  my $line=readline($fh);
  chomp($line);
  push (@{$ref_matrix}, [split( /\t/, $line)]);
}
close $fh;
$rows=$#{$ref_matrix};
$columns=$#{$ref_matrix->[1]};


if ($rows>$columns){
  for $i (0..$rows){
    for $j ($columns..$rows){
    push (@{$ref_matrix->[$i]}, 0);
    }
  }
} elsif ($columns>$rows){
    ${ref_zero_row}=['0'];
    for $i (1..$columns){
      push(@{$ref_zero_row}, ['0']);  
    }
    for $i ($rows..$columns){
      push @{$ref_matrix}, @{$ref_zero_row};
    }
  }
 foreach $i (@Zero_row){
 print "$i"."|";
 }
for $i(0..$#{$ref_matrix}-1) {
  for $j($i+1..$#{$ref_matrix}){
    $Bufer=$ref_matrix->[$i][$j];
    $ref_matrix->[$i][$j]=$ref_matrix->[$j][$i];
    $ref_matrix->[$j][$i]=$Bufer;
  }
}
for $i(0..$rows) {
  for $j(0..$columns) {
    print "$ref_matrix->[$i][$j]"." ";
  }
  print "\n";
  }

