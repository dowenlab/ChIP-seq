#!/bin/bash
#SBATCH --job-name=macs_broad
#SBATCH --ntasks=1
#SBATCH --mem=16G
#SBATCH -N 1
#SBATCH -n 12
#SBATCH --time=01:00:00
#SBATCH -e macs_broad.%job.err

#re-run end of ChIP-seq script to call broad peaks, need to have intermediate ChIP script files still there

DIR=/path/to/fastq/files/*fastq.gz
RepeatSequence='/path/to/repeatsequences/RepeatSequence.bed'

for f in ${DIR}
      do
      
module load macs
       
       macs2 callpeak -g mm -q 0.01 --broad -f BED -n ${f}-broad -t ${f}-fixall.bed
       awk '{print $1, $2-50, $3+50, $4, $5
       }' ${f}-broad_summits.bed > ${f}-broad-summits-exp50.bed
       bedtools intersect -a ${f}-broad-summits-exp50.bed -b ${RepeatSequence} -v -wa > ${f}-broad-summits-exp50-noreps.bed
       awk '{print $1, $2+50, $3-50, $4, $5
       }' ${f}-broad-summits-exp50-noreps.bed > ${f}-broad-summits-exp50-noreps-shrink.bed
done
