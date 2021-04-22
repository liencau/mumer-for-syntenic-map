#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -pe make 2
 perl get_snp_pairs.pl ../B73_v4_mummer_Mo17_v1.snps ./Mo17_contig_postion.bam B73_Mo17_snp_pairs
