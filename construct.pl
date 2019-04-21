#/usr/bin/perl
use strict;
use warnings;

my $file_name = "somewords.txt";
my @words;
my $set_symbols = "qwerasdfzxcvum";
my $i;


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
    push (@words, split( /\s/, $line));
}
close $fh;
for $i(@words){
    my $tmp_set = $set_symbols;
    my $tmp_word = lc($i);
    my $ok = 1;
        until (($tmp_word eq '') or (not $ok)){
            my $tmp_symbol = chop($tmp_word);
            if (not($tmp_set =~ s/$tmp_symbol//)){$ok = 0}
        }
    if ($ok) {print "$i\n"}
}


