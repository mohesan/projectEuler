use Data::Dumper;

#@matrix = genMatrix("/Users/rjphayes/Desktop/adderData");
#@tenner = add(@matrix);
$sum  = add("/Users/rjphayes/Desktop/adderData");
print "$sum\n";

# sub genMatrix {
# 	open (DATA ,"<",$_[0]);

# 	my @matrix;
# 	while($line = <DATA>){
# 		chomp($line);
# 		my @row = split('',$line);
# 		push(@matrix,[@row]);
# 	}
# 	return @matrix;
# }

sub add {
	my $num = 0;
	open (DATA ,"<",$_[0]);
	while($line = <DATA>){
		$num += $line;
	}
	return $num;
}