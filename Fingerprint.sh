#!/bin/bash
#SBATCH --job-name=fingerprint
#SBATCH --ntasks=1
#SBATCH --mem=12G
#SBATCH -N 1
#SBATCH -n 12
#SBATCH -e fingerprint.%job.err
#SBATCH --time=04:00:00

#make fingerprint plots for individual ChIP-seq replicates, this involves the intermediate ChIP-seq files, do before deleting

##need to have index file!! index the bam files first and make sure this is in the same file as the bam ##
	#module load samtools 
	#samtools index file.bam


module load deeptools/3.0.1

plotFingerprint -b /path/to/bam/file/sample1-rep1-mousereads-fix-sort.bam /path/to/bam/file/sample1-rep2-mousereads-fix-sort.bam /path/to/bam/file/sample2-rep1-mousereads-fix-sort.bam /path/to/bam/file/sample2-rep2-mousereads-fix-sort.bam -l sample1_rep1 sample1_rep2 sample2_rep1 sample2_rep2 --skipZeros -o /path/to/output/plot/fingerprint_indiv-reps.pdf
