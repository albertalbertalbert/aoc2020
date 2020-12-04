use strict;

my $fh;
my @numbs;
open $fh, '<', 'inp.txt';
while (<$fh>) {
    chomp;
    push @numbs, $_;
}
my $num_size = scalar @numbs;
print $num_size;
@numbs = sort @numbs;
for my $i ( 0 .. $num_size - 1 ) {
    my $j = $num_size - 1;
    while ( $j >= 0 ) {
        if ( $numbs[$i] + $numbs[$j] > 2020 ) {
            $j = -1;
        }
        else {
            my $k = $num_size - 1;
            while ( $k >= 0 ) {
                if ( $numbs[$i] + $numbs[$j] + $numbs[$k] == 2020 ) {
                    printf "%d * %d * %d = %d \n", $numbs[$i], $numbs[$j],
                      $numbs[$k], $numbs[$i] * $numbs[$j] * $numbs[$k];
                    exit;
                }
                elsif ( $numbs[$i] + $numbs[$j] + $numbs[$k] < 2020 ) {
                    $k = 0;
                }
                $k--;
            }
            $j--;
        }
    }

}
