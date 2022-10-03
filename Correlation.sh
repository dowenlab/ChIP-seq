#!/bin/bash
#SBATCH --job-name=correlation
#SBATCH --ntasks=1
#SBATCH --mem=6G
#SBATCH -N 1
#SBATCH -n 12
#SBATCH -e correlation.%job.err
#SBATCH --time=00:40:00

#make a matrix using miltiBigwigSummary before making a correlation plot


module add deeptools/3.2.0


multiBigwigSummary BED-file -b /path/to/signaltrack/sample1.bw /path/to/signaltrack/sample2.bw  -o /path/to/outputmatrix/matrix.npz --BED /path/to/reference/peak/list/peaklist.bed


plotCorrelation --corData /path/to/outputmatrix/matrix.npz --corMethod pearson --whatToPlot scatterplot --skipZeros --labels sample1 sample2 --removeOutliers --plotFileFormat pdf -o /path/to/output/plot/correlation.corr-plot.pdf

