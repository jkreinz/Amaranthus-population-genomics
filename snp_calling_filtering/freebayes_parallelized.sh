#Julia Kreiner, June 2018
#this script needs to be run out of the freebayes/scripts folder that can be downloaded from the freebayes gitpage. It will loop over predefined chopped regions ($file = a list of 100, 100KB regions, generated by freebayes script fasta_generate_regions.py)
#freebayes has a bug that every single RG must be distinct between samples - make sure this is the case! 

while read file
do

./freebayes-parallel ${file} 10 -f ~/waterhemp/refs/tuberculatus_ref/homo/run1/scaffolds.reduced.fa --use-best-n-alleles 4 ../../sorted/finalbams/*.bam > ../../sorted/finalbams/${file}.vcf 2> ../../sorted/finalbams/${file}.err &

done < regions07.list