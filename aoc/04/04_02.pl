use strict;
my $fh;
open $fh, '<', "inp.txt" or die "Could not open inp.txt\n";

my @keys = ( "byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:" );
my @opt  = ("cid:");
my $records;
my $valid = 0;
while (<$fh>) {
    chomp;
    if ( $_ =~ /^(\s*)$/ ) {
        my $found = 1;

        #my $key;
        foreach my $key (@keys) {

            if ( !( $records =~ /$key/ ) ) {
                $found = 0;
                printf "Record:\t%s\tMissing key:\t%s\n", $records, $key;

            }

        }
        if ($found) {
            my @values = split /\s/, $records;
            my $pair;

            foreach $pair (@values) {
                my ( $k, $v ) = split /:/, $pair;
                if ( $k eq "byr" ) {
                    $found = ( $v =~ /^\d{4}$/ && $v >= 1920 && $v <= 2002 );
                    if ( !$found ) {
                        printf "Rule for byr for %s not matched\n", $records;
                    }
                }
                if ( $k eq "iyr" ) {
                    $found = ( $v =~ /^\d{4}$/ && $v >= 2010 && $v <= 2020 );
                    if ( !$found ) {
                        printf "Rule for iyr for %s not matched\n", $records;
                    }
                }
                if ( $k eq "eyr" ) {
                    $found = ( $v =~ /^\d{4}$/ && $v >= 2020 && $v <= 2030 );
                    if ( !$found ) {
                        printf "Rule for eyr for %s not matched\n", $records;
                    }
                }
                if ( $k eq "ecl" ) {
                    $found =
                      (      $v eq "amb"
                          || $v eq "blu"
                          || $v eq "brn"
                          || $v eq "gry"
                          || $v eq "grn"
                          || $v eq "hzl"
                          || $v eq "oth" );
                    printf "Rule for ecl for %s not matched.\n", $records
                      if !$found;
                }
                if ( $k eq "pid" ) {
                    $found = ( $v =~ /^\d{9}$/ );
                    printf "Rule for pid for %s not matched\n", $records
                      if !$found;
                }

                if ( $k eq "hcl" ) {
                    $found = ( $v =~ /^#(\d|[a-f]){6}$/ );
                    printf "Rule for hcl for %s not matched\n", $records
                      if !$found;
                }
				
				if ($k eq "hgt"){
					$found = ($v =~ /(^1[5-8]\dcm$)|(^6\din$)|(^19[0-6]cm$)|(^59in$)|(^6\din$)|(^7[0-6]in$)/);
					printf "Rule for hgt for %s not matched\n", $records if !$found;
				}
                last if !$found;
            }

        }
        $valid++ if ($found);
        $records = "";
    }
    else {
        $records .= " " . $_;
    }

}

close $fh;

printf "%d valid passports in inp.txt\n", $valid;
