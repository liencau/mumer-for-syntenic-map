#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -pe make 1

perl extract_aim_chr.pl /NAS1/lien/data/sorghum/Sorghum_bicolor.Sorghum_bicolor_NCBIv3.dna.10chr.fa 10 sorghum.chr10.fa

#/NAS7/home/shijunpeng/software/MUMmer3.23/nucmer --prefix=sorghum-coix --mum /NAS1/lien/data/sorghum/Sorghum_bicolor.Sorghum_bicolor_NCBIv3.dna.10chr.fa /NAS1/lien/data/coix/BJCoxi_reference.V1.fa -l 50
#/NAS7/home/shijunpeng/software/MUMmer3.23/dnadiff -d sorghum-coix.delta
#perl draw_synteny_map_from_mcoords.pl /NAS1/lien/data/sorghum/Sorghum_bicolor.Sorghum_bicolor_NCBIv3.dna.10chr.fa /NAS1/lien/data/coix/BJCoxi_reference.V1.fa out.1coords Yiyi-hybrid-new-sorghum-dnadiff.SVG


#nucmer --prefix=sorghum-coix  --mum  ../../../z-reference/sorghum.fa  ../../0-gene-annotation/Yiyi.hybird.fasta -L 50
#dnadiff -d sorghum-coix.delta
#perl draw_synteny_map_from_mcoords.pl ../../0-gene-annotation/Yiyi.hybird.fasta ../../../z-reference/sorghum.fa out.1coords Yiyi-hybrid-new-sorghum-dnadiff.SVG
