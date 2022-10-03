#!/bin/bash
#SBATCH --job-name=AvgSignal_Merge
#SBATCH --ntasks=1
#SBATCH --mem=6G
#SBATCH -N 1
#SBATCH -n 6
#SBATCH --time=1:00:00
#SBATCH -e AvgSignal.Merge.err

#make an average signal plot at a reference peak list

module load deeptools/3.0.1

computeMatrix reference-point -S /path/to/signaltrack/sample1.bw /path/to/signaltrack/sample2.bw -R /path/to/peak/list/peaklist.bed -a 1000 -b 1000 -out /path/to/outputmatrix/matrix.mat.gz -bs 10 -p 24 --missingDataAsZero

plotProfile -m /path/to/outputmatrix/matrix.mat.gz -out /path/to/output/plot/AveSignalPlot.pdf --colors red blue --plotHeight 8 --plotWidth 8  --samplesLabel  "Sample1" "Sample2" --yMax 20 --refPointLabel "PeakList" --perGroup  --plotType lines  --dpi 1000 
