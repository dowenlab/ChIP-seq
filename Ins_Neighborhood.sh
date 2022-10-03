#!/bin/bash
#SBATCH --job-name=Ins_Neighborhood
#SBATCH --ntasks=1
#SBATCH --mem=2G
#SBATCH -N 1
#SBATCH -n 12
#SBATCH -e Neighborhoods.%job.err
#SBATCH --time=02:00:00

#make average signal plot across insulated neighborhoods, -m is average size calculated using GetAverage.bw


module add deeptools/3.2.0

computeMatrix scale-regions -S /path/to/signaltrack/sample1.bw /path/to/signaltrack/sample2.bw -R /path/to/insulated/neighborhoods/InsulatedNeighborhoods-2014Jill.bed -a 75000 -b 75000 -m 174410 -out /path/to/outputmatrix/neighborhoods.mat.gz -bs 10 -p 12 --missingDataAsZero

plotProfile -m /path/to/outputmatrix/neighborhoods.mat.gz -out path/to/outputplot/neighborhoods.plot.pdf --averageType mean --plotType lines --colors green darkturquoise --refPointLabel "Insulated Neighborhoods"  --samplesLabel sample1 sample2 --perGroup --plotFileFormat pdf

