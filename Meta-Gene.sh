#!/bin/bash
#SBATCH --job-name=Meta-Gene
#SBATCH --ntasks=1
#SBATCH --mem=2G
#SBATCH -N 1
#SBATCH -n 12
#SBATCH -e Meta-Gene.%job.err
#SBATCH --time=02:00:00

#make a meta-gene plot, -m is the average size calculated using GetAverage.bw

module add deeptools/3.2.0

computeMatrix scale-regions -S /path/to/signaltrack/sample1.bw /path/to/signaltrack/sample2.bw -R /path/to/whole/gene/coordinates/AllGenesBioMart_Strand_NoNA_FIX.bed -a 75000 -b 75000 -m 46928 -out /path/to/outputmatrix/metagene.mat.gz -bs 10 -p 12 --missingDataAsZero

plotProfile -m /path/to/outputmatrix/metagene.mat.gz -out /path/to/outputplot/metagene.plot.pdf --averageType mean --plotType lines --colors Orange Purple --refPointLabel "MetaGene"  --samplesLabel sample1 sample2 --perGroup --plotFileFormat pdf

