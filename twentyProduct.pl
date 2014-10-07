use Data::Dumper;

open(DATA,"<","/Users/rjphayes/Desktop/twentyData.txt");
#list of rows -- matrix
my @matrix = matrix(\*DATA);
close(DATA);
#list of columns -- matrix
my @transpose = transpose(@matrix);
#right diagonal \
my @rightDiag = rightDiag(@matrix);
#left diagonal /
my @leftDiag  = leftDiag(@matrix);

my @totalList;
push(@totalList,@matrix);
push (@totalList,@transpose);
push (@totalList,@rightDiag);
push (@totalList,@leftDiag);

@group = main(@totalList);
print "(",join(',',@group),")\n";

sub matrix {
	my $file = $_[0];

	my @matrix;
	while(<$file>){
    	@row = split(' ',$_);
    	push(@matrix,[@row]);
	}
	return @matrix;
}

sub transpose {
	my @matrix = @_;
	my @transpose;

	for $m (0..($#{$matrix[0]})) {
		for $n (0..($#matrix)) {
			$transpose[$n][$m] = $matrix[$m][$n];
		}
	}
	return @transpose;
}

#push behaviour changes the matrix, not sure if this is a bad thing
sub rightDiag {
	my @matrix = @_;
	my @rightDiag;
	my $dimRow = $#matrix;
	my $dimCol = $#{ $matrix[0]};

	for $i (0..($dimRow)){
		$n = ($dimRow - $i);
		$m = 0;
		my @currentDiag;

		while ($matrix[$n][$m]){
			push(@currentDiag,$matrix[$n][$m]);
			$n++;
			$m++;
		}
		push(@rightDiag,[@currentDiag]);
	}

	for $i (1..($dimCol)){
		$n = 0;
		$m = $i;
		my @currentDiag;

		while ($matrix[$n][$m]){
			push(@currentDiag,$matrix[$n][$m]);
			$n++;
			$m++;
		}
		push(@rightDiag,[@currentDiag]);

	}
	return @rightDiag;
}

sub leftDiag {
	my @matrix = @_;
	my @leftDiag;
	my $dimRow = $#matrix;
	my $dimCol = $#{ $matrix[0]};

	for $i (0..($dimCol)){
		$n = 0;
		$m = $i;
		my @currentDiag;

		while ( ($matrix[$n][$m]) && ($n >= 0) && ($m >= 0) ){
			push(@currentDiag,$matrix[$n][$m]);
			$n++;
			$m--;
		}
		push(@leftDiag,[@currentDiag]);
	}

	for $i (1..($dimCol)){
		$n = $i;
		$m = 19;
		my @currentDiag;

		while (($matrix[$n][$m]) && ($n >= 0) && ($m >= 0) ){
			push(@currentDiag,$matrix[$n][$m]);
			$n++;
			$m--;
		}
		push(@leftDiag,[@currentDiag]);

	}
	return @leftDiag;
}

sub main {
    my @groups = @_;
    my @maxL;
    my $max = 1;
    
    for my $group (@groups) {
    	@group = @{ $group };
        unless ($#group < 3){
            my @testL = largestProduct(@group);
            my $testM  = shift(@testL);
            #print "$testM\n@testL\n";
            if ($testM > $max){
                $max  = $testM;
                @maxL = @testL;
            }
        }
    }
    return @maxL;
}

sub largestProduct {
    my @seq  = @_;
    my $max  = 1;
    my @maxL;
    
    for my $Spos (0..($#seq-3)){
        my $product = 1;
        my @testP  = @seq[($Spos)..($Spos+3)];
        for my $num (@testP){
            $product *= $num;
            
        }
        if ($product > $max){
            $max  = $product;
            @maxL = @testP;
        }
    }
    unshift(@maxL,$max);
    return @maxL;
}















