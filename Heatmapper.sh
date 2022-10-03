#!/bin/bash
#SBATCH --job-name=heatmap
#SBATCH --ntasks=1
#SBATCH --mem=12G
#SBATCH -N 1
#SBATCH -n 10
#SBATCH -e heatmap.err
#SBATCH --time=1:00:00

module load deeptools/2.4.1

#run compute matrix to collect the data needed for plotting

computeMatrix reference-point -S /path/to/signaltrack/sample1.bw /path/to/signaltrack/sample2.bw -R /path/to/reference/peak/list/peaklist.bed -a 2500 -b 2500 -out /path/to/outputmatrix/matrix.mat.gz -bs 20 -p 24 --missingDataAsZero

plotHeatmap -m /path/to/outputmatrix/matrix.mat.gz -out /path/to/outputplot/heatmap.pdf --colorMap Reds Blues --refPointLabel "0" --whatToShow 'heatmap and colorbar' --samplesLabel sample1 sample2 --startLabel peaks --heatmapHeight 40 --heatmapWidth 4 --sortRegions descend --sortUsingSamples 1 --missingDataColor "#FFFFFF" --dpi 1000 --plotFileFormat pdf
