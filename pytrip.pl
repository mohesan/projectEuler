my $y = 0;
my $x;
while ($y += 1){
	$x = (1000*($y - 500))/($y - 1000);
	$c = sqrt($x**2+$y**2);
	if (isInt($c) && isInt($x)) {
		last;
	}
}
print "a = $x, b = $y, c = $c\n";

sub isInt {
	my $num = $_[0];
	
	if ($num =~/^\d+\z/){
		return 1;
	}else{
		return 0;
	}
}
