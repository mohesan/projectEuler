#first sunday was April 1900, second was July
use Data::Dumper;
use Set::Light;
my $thirty   = Set::Light->new(qw/9 4 6 11/);
my $thirtyOne = Set::Light->new(qw/1 3 5 7 8 10/);

$day   = 0;
$month = 3;
$year  = 1900;
$counter = 0;
while ($year <= 2000){
	if ($thirty->has($month)){
		$day = ($day + 30)%7;
	} elsif ($thirtyOne->has($month)) {
		$day = ($day + 31)%7
	} elsif ($month == 2) {
		if (($year%4)==0) {
			$day = ($day + 29)%7;
		} else {
			$day = ($day + 28)%7;
		}
	} else {
		$day = ($day + 31)%7;
		$month = 0;
		$year++;
	}
	$month++;
	if ($day == 0){
		$counter++;
	}
}
print "$counter\n";