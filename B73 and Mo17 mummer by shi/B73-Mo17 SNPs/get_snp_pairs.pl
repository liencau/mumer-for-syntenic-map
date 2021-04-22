#!usr/bin/perl
use warnings;
use strict;

my ($file,$ref,$file_out)=@ARGV;
open F,"$file" or die;
open R,"samtools view $ref|" or die;
open O,">",$file_out or die;

my %pos;
my %chr;
while(<R>){
	chomp;
	my @arr=split/\s+/;
	if (/@/){
		next;
	}
	if(exists $pos{$arr[0]}){
		die;
	}

	$pos{$arr[0]}=$arr[3];
	$chr{$arr[0]}=$arr[2];
}
close R;


while(<F>){
	chomp;
	my @array=split/\s+/;
	if(!exists $pos{$array[-1]} || $chr{$array[-1]} eq "*"){
		next;
	}
	print O "$array[-2]\t$array[0]\t$array[1]\t$array[2]\t";
	my $mo17_pos=$array[3]+$pos{$array[-1]}-1;
	my $mo17_chr=$chr{$array[-1]};
	unless($array[-4] == 1){
		die;
	}
	if($array[-3] == -1 ){
		$array[2]=~tr/A|T|C|G|N/T|A|G|C|N/;
		$array[1]=~tr/A|T|C|G|N/T|A|G|C|N/;
	}
	print O "$mo17_chr\t$mo17_pos\t$array[2]\t$array[1]\n";
}

	
