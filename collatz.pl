use strict;
use warnings;

my $number = $ARGV[0];
my @solution = main($number);
print "number: $solution[0]\nlength of Collatz Sequence: $solution[1]\n";

sub main {
	my $under = $_[0];
	my $max = 0;
	my $maxN = 1;
	for(my $n = 1; $n < $under; $n+=2){
		my $tmp = collatzLen($n);
		if ($tmp > $max){
			$max = $tmp;
			$maxN = $n
		}
	}
	return ($maxN,$max);	
}

sub collatzLen {
	my $n = $_[0];
	my $len = 1;

	$len += int(logTwo(1000_000/$n));

	for(;;){
		if (isOdd($n)) {
			$n = 3*$n + 1;
		}else{
			$n /= 2;
		}

		if (fastTwo($n)) {
			$len += logTwo($n)+1;
			return $len;
		}
		$len++;
	}
}

sub fastTwo {
	my $n = $_[0];
	return !($n & ($n-1)); #fast bitwise check of power two-iness
}

sub logTwo {
	my $n = $_[0];
	return log($n)/log(2);
}

sub isOdd {
	my $n = $_[0];
	return ($n & 1);
}