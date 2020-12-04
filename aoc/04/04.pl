use strict;
my $fh;
open $fh, '<', "inp.txt" or die "Could not open inp.txt\n";

my @keys = ("byr:", "iyr:", "eyr:", "hgt:", "hcl:", "ecl:", "pid:");
my @opt = ("cid:");
my $records;
my $valid = 0;
while(<$fh>){
	chomp;
	if ($_ =~ /^(\s*)$/){
		my $found = 1;
		#my $key;
		foreach my $key (@keys){
			
			if (!($records =~ /$key/)){
				$found = 0;
				printf "Record:\t%s\tMissing key:\t%s\n", $records, $key;
			
			}
			
		}
		$valid++ if ($found);
		$records = "";
	}
	else {
		$records .= $_;
	}
	
	
}

close $fh;

printf "%d valid passports in inp.txt\n", $valid;