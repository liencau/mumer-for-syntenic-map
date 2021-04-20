#!/usr/bin/perl
use strict;
use warnings;
use SVG;

die usage() if @ARGV == 0;
my ($longmi,$foxtail_millet,$coords,$output) = @ARGV;
my $svg = SVG->new(width=>2000, height=>1000);




my %hash_scaffolds;
my $seq_name1;
open NEW,"$longmi" or die;
while(<NEW>){
	chomp;
	if(/>/){
		$_ =~ s/>//;
		my @aa = split /\s+/;
		$seq_name1 = $aa[0];
	}
	else{
		$hash_scaffolds{$seq_name1} .= $_;
	}
}
close NEW;

my %hash_chrs;
my $seq_name2;
open NEW,"$foxtail_millet" or die;
while(<NEW>){
	chomp;
	if(/>/){
		$_ =~ s/>//;
		my @aa = split /\s+/;
		$seq_name2 = $aa[0];
	}
	else{
		$hash_chrs{$seq_name2} .= $_;
	}
}
close NEW;

## draw the bar chart of fortail millet chromosomes
my $add_y = 10;
my %hash_y;
foreach my $key(sort keys %hash_chrs){
	next if ($key =~ /Mt/ or $key =~ /Pt/ or $key =~ /super/);
#	$key =~ /scaffold_(\d+)/;
#	if($1 < 10){
		my $length = length($hash_chrs{$key});
		$hash_y{$key} = $add_y;
		$svg->line(x1=>10,y1=>$add_y,x2=>10,y2=>$add_y+$length/1000000,stroke=>'black',"stroke-width"=>2);
		$svg->text(x =>10-2,y =>$add_y+$length/2000000, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>3, "-cdata" => "$key");
		$add_y = $add_y+$length/1000000+1;
#	}
}

## draw the bar chart of scaffolds
my $add_x = 12;
my %hash_x;
foreach my $key(sort keys %hash_scaffolds){
	my $length = length($hash_scaffolds{$key});
	$hash_x{$key} = $add_x;
	if($key =~ /ctg/){
		$svg->line(x1=>$add_x,y1=>$add_y,x2=>$add_x+$length/1000000,y2=>$add_y,stroke=>'black',"stroke-width"=>2);
		$add_x = $add_x+$length/1000000+0.1;
	}
	else{
		$svg->line(x1=>10,y1=>$add_y,x2=>$add_x+$length/1000000,y2=>$add_y,stroke=>'black',"stroke-width"=>2);
		$svg->text(x=>$add_y+$length/2000000, y=>10-2, width => 2, height => 2, "font-family"=>"Arial", "text-anchor"=>"end","font-size"=>3, "-cdata" => "$key");
		$add_x = $add_x+$length/1000000+0.1;
	}
}

open NEW,"$coords" or die;
while(<NEW>){
	chomp;
	my @array = split /\s+/;
	## draw the synteny comparison
#	$svg->line(x1=>$hash_x{$array[-1]}+$array[2]/1000000,y1=>$hash_y{$array[-2]}+$array[0]/1000000,x2=>$hash_x{$array[-1]}+$array[3]/1000000,y2=>$hash_y{$array[-2]}+$array[1]/1000000,stroke=>'red',"stroke-width"=>10);
#	$array[-2] =~ /scaffold_(\d+)/;
	next if ($array[-2] =~ /Mt/ or $array[-2] =~ /Pt/ or $array[-2] =~ /super/);
#	if($1 < 10){
		$svg->circle(cx => $hash_x{$array[-1]}+($array[2]+$array[3])/2000000, cy => $hash_y{$array[-2]}+($array[0]+$array[1])/2000000, r => 1, fill => "red");
#	}
}
close NEW;

my $out = $svg->xmlify;
open SVGFILE,">$output" or die;
print SVGFILE $out;
close SVGFILE;

sub usage{
	my $die =<<DIE;
	usage : perl *.pl longmi.sca.fasta foxtail_millet.chr.fa *.coords output.SVG
DIE
}
