#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -pe make 2

ln -s ../Zm-Mo17-REFERENCE-CAU-1.0.fa Zm-Mo17-REFERENCE-CAU-1.0.fa
bwa index Zm-Mo17-REFERENCE-CAU-1.0.fa Zm-Mo17-REFERENCE-CAU-1.0.fa

bwa mem Zm-Mo17-REFERENCE-CAU-1.0.fa  ../Zm-Mo17-REFERENCE-CAU-1.0.contigs.fa | samtools view -bS - > Mo17_contig_postion.bam

