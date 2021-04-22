#!/usr/bin/perl
use strict;
use warnings;

my($file,$file_out)=@ARGV;

open F,$file or die;
open O,">",$file_out or die;

while(<F>){
	chomp;
	my @arr=split;
	$arr[0]=~s/Chr//g;
	$arr[4]=~s/chr//g;

	unless($arr[0] eq  "$arr[4]"){
		next;
	}
	if(abs($arr[5]-$arr[1]) > 10000000){
		next;
	}
	if($arr[3] eq  '.' || $arr[2] eq  '.' ){
		next;
	}
	else{
		print O $_,"\n";
	}
}
