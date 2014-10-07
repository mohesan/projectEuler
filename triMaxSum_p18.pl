use strict;
use warnings;
use Data::Dumper;

my $dataFile = '/Users/rjphayes/Desktop/triData';
my @matrix = genMatrix($dataFile);
@matrix = reduce(1,@matrix);
print Dumper(\@matrix);

sub genMatrix {
       open (DATA ,"<",$_[0]);

       my @matrix;
       while(my $line = <DATA>){
               chomp($line);
               my @row = split(/\s/,$line);
               push(@matrix,[@row]);
       }
       return @matrix;
}

sub reduce {
	my $rowNum = shift(@_);
	my @matrix = @_;
	for (my $i=0;$i<=$rowNum;$i++){
		$matrix[$rowNum][$i]+=max(($matrix[$rowNum+1][$i]),($matrix[$rowNum+1][$i+1]))
	}
	delete $matrix[$rowNum+1]; 
	return @matrix;
}

sub max {
	if ($_[0]>$_[1]){
	return $_[0];
	}else{
	return $_[1];
	}
}
