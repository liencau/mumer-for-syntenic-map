#!/sub/bin/perl -w
use strict;

my ($in,$pa,$out)=@ARGV;
open IN,"$in" or die;
open OUT,"+>$out" or die;
my %hash;
while(<IN>){
        chomp;
        my $fir=(split(/\s+/,$_))[0];
        my $sed=<IN>;
        chomp($sed);
        $hash{$fir}=$sed;
}
close IN;

my $one=">".$pa;
if(exists $hash{$one}){
	my $seq=$hash{$one};
	print OUT "$one\n$seq";
}else{
	print OUT "ERROR:$one\n";
}
close OUT;
