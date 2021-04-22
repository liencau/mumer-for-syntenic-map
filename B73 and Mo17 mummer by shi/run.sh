#!/bin/bash
#
#$ -cwd
#$ -j y
#$ -S /bin/bash
#$ -pe make 1

#cp /NAS7/home/shijunpeng/data/perl_scripts/convert_scaffolds_into_contigs.pl ./

perl convert_scaffolds_into_contigs.pl  ./Zm-Mo17-REFERENCE-CAU-1.0.fa ./Zm-Mo17-REFERENCE-CAU-1.0.contigs.fa

/NAS7/home/shijunpeng/software/MUMmer3.23/nucmer  --mumreference -c 90 -l 40 -p ./B73_v4_mummer_Mo17_v1 ./Zm-B73-REFERENCE-GRAMENE-4.0.fa ./Zm-Mo17-REFERENCE-CAU-1.0.contigs.fa

echo -e "\n"

/NAS7/home/shijunpeng/software/MUMmer3.23/dnadiff -d ./B73_v4_mummer_Mo17_v1.delta -p ./B73_v4_mummer_Mo17_v1

