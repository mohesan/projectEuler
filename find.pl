$string1 = 'HCC38.bam';
$string2 = 'HCC38_first.bam';
$string3 = 'HCC38_second.bam';

print "$string1\n" if ($string1 =~ /HCC38(_first|)\.bam$/);
print "$string2\n" if ($string2 =~ /HCC38(|_first|_second)\.bam$/);

#print ($string2 =~ /HCC38[,(_first),(_second)].bam$/),"\n";
#print ($string3 =~ /HCC38[,(_first),(_second)].bam$/),"\n";