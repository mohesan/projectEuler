use strict;
use warnings;
use Math::BigInt;


my $n=100;
Math::BigInt->new($n);
my $x = fac($n);

my $sum = digitalSum($x);
print "$sum\n";

sub fac {
    my ($m) = shift;

    return 1 if($m <=1 );
    return Math::BigInt->new($m*fac($m-1));
}
sub digitalSum {
	my $numH = shift;
	my $len = length($numH);
	my $x;

	for(my $p = 0;$p < $len;$p++){
		$x = $numH->digit($p);
		$sum += $x;
	}
	return $sum;
}

