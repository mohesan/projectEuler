use strict;
use warnings;

main();

sub main {
	for (my $n = 2;;$n++) {
		if (countFactors(T_n($n))> 500){
			print T_n($n),"\n";
			last;
		}
	}
}

sub T_n {
	my $order = $_[0];
	my $t = (($order)*($order - 1))/2;
	return $t;
}

#print countFactors(28),"\n";

sub countFactors {
	my $num = $_[0];
	my $sqrt = sqrt($num);
	my $count = 0;

	if ($sqrt =~ /^\d+\z/){
		$count ++;
	}

	for (my $p = 1;$p <= ($sqrt-1);$p++){
		unless ($num % $p){
	 		$count += 2;
	 	}
	}
	$count --;
	return $count;
}