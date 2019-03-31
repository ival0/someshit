#/usr/bin/perl

use strict;
use warnings;

my $i;
my $j;
my $bufer;
my $file_name = "matrix.dat";
my @matrix = [];
my $ref_matrix = \@matrix;
my @zero_row = [];
my $ref_zero_row = \@zero_row;
my $rows;
my $columns;

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
    my $line = <$fh>;
    chomp($line);
    push (@{$ref_matrix}, [split( /\t/, $line)]);
}
close $fh;

$rows = $#{$ref_matrix};
$columns = $#{$ref_matrix->[1]};
shift @{$ref_matrix};

if ($rows>$columns){
    for $i (0..$rows){
        while($#{$ref_matrix->[$i]}<$rows){
        push (@{$ref_matrix->[$i]}, 0);
        }
    }
} elsif ($columns>$rows){
        for $i (1..$columns){
            push(@{$ref_zero_row}, ['0']);    
        }
        while ($#{$ref_matrix}<$columns){
            push @{$ref_matrix}, @{$ref_zero_row};
        }
    }

for $i(0..$#{$ref_matrix}-1) {
    for $j($i+1..$#{$ref_matrix}){
        $bufer = $ref_matrix->[$i][$j];
        $ref_matrix->[$i][$j] = $ref_matrix->[$j][$i];
        $ref_matrix->[$j][$i] = $bufer;
    }
}

$bufer  =  $rows;
$rows   =  $columns;
$columns = $bufer;

if ($rows>$columns){
    for $i (0..$rows){
        while ($#{$ref_matrix->[$i]}>$columns){
            pop @{$ref_matrix->[$i]};
        }
    }

} elsif ($columns>$rows){
        while ($#{$ref_matrix}>$rows){
            pop @{$ref_matrix};
        }
    }

foreach $i(@{$ref_matrix}) {
    foreach $j(@{$i}) {
        print "$j"." ";
    }
    print "\n";
}