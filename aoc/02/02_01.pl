use strict;
my $fh;
my $result = 0;
my $bad    = 0;

open $fh, '<', "input_data.txt" or die "Could not open input_data.txt";

while (<$fh>) {
    chomp;
    my ( $code,  $pw )      = split /:/,  $_;
    my ( $range, $let )     = split /\s/, $code;
    my ( $allow, $exclude ) = split /-/,  $range;
    $pw =~ s/(^\s+)|(\s+$)//g;
    my $pos1 = substr $pw, $allow - 1,   1;
    my $pos2 = substr $pw, $exclude - 1, 1;
	print "\n******************************************************\n";
	printf "Password:\t%s\tLetter:\t%s\n", $pw, $let;
    printf "Pos1:\t%s\tPos2:\t%s\n", $pos1, $pos2;
    ##printf "Letter:\t%s\n", $let;

    if ( ( $pos1 eq $let || $pos2 eq $let )
        && !( $pos1 eq $let && $pos2 eq $let ) )
    {
        $result++;
    }
    else {
        printf "For allowed positions %s, %s has invalid occurrences of %s\n",
          $range, $pw, $let;
        $bad++;
    }

}
close $fh;
printf "There are %d valid passwords in the input file.\n", $result;
printf "there are %d invalid passwords.\n",                 $bad;

