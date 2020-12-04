use strict;
my $fh;
my $result = 0;

open $fh, '<', "input_data.txt" or die "Could not open input_data.txt";
sub count_occ {
	my ($letter, $str2ck) = @_;
	if (length $str2ck == 1){
		return ($letter eq substr $str2ck, 0, 1);
	} else {
	return ($letter eq substr $str2ck, 0, 1) + count_occ($letter, substr $str2ck, 1, length $str2ck);
	}
}
while (<$fh>){
	chomp;
	my ($code, $pw) = split /:/, $_;
	my ($range, $let) = split /\s/, $code;
	my ($min, $max) = split /-/, $range;
	my $cnt = count_occ $let, $pw;
	if ($min <= $cnt && $max >= $cnt){
		printf "For range %s, %s has %d valid occurrences of %s\n", $range, $pw, $cnt, $let;
		$result++;
	}
	
	
	
	
}
close $fh;
printf "There are %d valid passwords in the input file.\n", $result;



