use strict;

open my $fh, '<', "inp.txt" or die "Could not open inp.txt\n";

my $right = 3;
    my $trees = 0;
    my $pos   = 0;
    my $row   = 0;
my $total = 1;
my $right = 0;
for $right ( 1, 3, 5, 7 ) {

    #my $right = $_;
$trees = 0;
$pos = 0;
    open my $fh, '<', "inp.txt" or die "Could not open inp.txt\n";
    while (<$fh>) {
        chomp;

        #my $width = length $_;
        if ( substr( $_, $pos, 1 ) eq "#" ) {
            $trees++;

            #printf "Row %d:\tTree found at position %d\n", $row, $pos;
        }
        $pos += $right;
        $pos %= length $_;
        $row++;

    }

    printf "\nMove to right:\t%d\n", $right;
    printf "Total trees:\t%d\n",     $trees;
    close $fh;
    $total *= $trees;
    printf "Product of total:\t%d\n", $total;
}
open my $fh, '<', "inp.txt" or die "Could not open inp.txt\n";
$right = 1;
$trees = 0;
$pos   = 0;
$row   = 0;
while (<$fh>) {
    chomp;
    if ( $row % 2 == 0 ) {

        #my $width = length $_;
        if ( substr( $_, $pos, 1 ) eq "#" ) {
            $trees++;

            printf "Row %d:\tTree found at position %d\n", $row, $pos;
        }
		    $pos += $right;
    $pos %= length $_;
    }

    $row++;

}
printf "\nRight 1, Down 2.  Total trees:\t%d\n", $trees;
printf "Final product:\t%d\n", $total *= $trees;
close $fh;

