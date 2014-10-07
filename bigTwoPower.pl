use Math::BigInt;
my $binString = '0b1'.'0'x1000;
my $numH = Math::BigInt->new($binString);
$sum = 0;
while ($x->digit($numH)){
	$sum += $x;
}
print "$sum\n";
