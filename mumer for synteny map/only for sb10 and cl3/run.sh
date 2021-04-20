#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -pe make 1


#/NAS7/home/shijunpeng/software/MUMmer3.23/nucmer --prefix=sorghum-coix --mum sorghum.chr10.v2.fa coix.chr3.v2.fa -l 50
#/NAS7/home/shijunpeng/software/MUMmer3.23/dnadiff -d sorghum-coix.delta
perl sorghum.chr10.v2.fa coix.chr3.v2.fa coix.chr3.v2.fa sorghum.chr10.v2.fa Yiyi-hybrid-new-sorghum-dnadiff.SVG

#nucmer --prefix=sorghum-coix  --mum  ../../../z-reference/sorghum.fa  ../../0-gene-annotation/Yiyi.hybird.fasta -L 50
#dnadiff -d sorghum-coix.delta
#perl draw_synteny_map_from_mcoords.pl ../../0-gene-annotation/Yiyi.hybird.fasta ../../../z-reference/sorghum.fa out.1coords Yiyi-hybrid-new-sorghum-dnadiff.SVG
