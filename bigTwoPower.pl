use Math::BigInt;
my $binString = '0b1'.'0'x1000;
my $numH = Math::BigInt->new($binString);
$sum = 0;
$len = length($numH);
print $len,"\n";

for(my $p = 0;$p < $len;$p++){
	$x = $numH->digit($p);
	$sum += $x;
}

print "$sum\n";
