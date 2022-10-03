#!/bin/bash
#SBATCH --job-name=DNA_anchors
#SBATCH --ntasks=1
#SBATCH --mem=12G
#SBATCH -N 1
#SBATCH -n 12
#SBATCH -e DNA_anchors.%job.err
#SBATCH --time=02:00:00

#make an average signal plot at DNA loop anchors defined in Dowen et al 2014, -m is average size calculated using GetAverage.bw


module add deeptools/3.2.0

computeMatrix scale-regions -S /path/to/signaltrack/sample1.bw /path/to/signaltrack/sample2.bw -R /path/to/ChIA-PET/anchors/ChIA-anchors_mm10_Dowen2014.bed -a 2500 -b 2500 -m 2140 -out /path/to/outputmatrix/matrix.mat.gz -bs 10 -p 12 --missingDataAsZero

plotProfile -m /path/to/outputmatrix/matrix.mat.gz -o /path/to/output/plot/anchors.plot.pdf --averageType mean --plotType lines --colors green orange --refPointLabel "ChIP-PET Anchors"  --samplesLabel sample1 sample2 --perGroup --plotFileFormat pdf


