#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -pe make 1

perl filt_SNP_by_distance_and_chr.pl B73_Mo17_snp_pairs B73_Mo17_snp_pairs_filtered
