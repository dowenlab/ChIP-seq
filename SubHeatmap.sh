#!/bin/bash
#SBATCH --job-name=SubHeatmap
#SBATCH --ntasks=1
#SBATCH --mem=6G
#SBATCH -N 1
#SBATCH -n 6
#SBATCH -e SubHeatmap.%job.err
#SBATCH --time=0:30:00

module add deeptools/3.0.1


#bigwigCompare -b1 PDS5_Merge/PDS5B_5A-KO_Merge_NLA_ChIP17.fastq.gz.bw -b2 PDS5_Merge/PDS5B_WT_Merge_NLA_ChIP17.fastq.gz.bw --operation subtract --outFileName PDS5B-WT_A-KO-Sub.bw

#computeMatrix reference-point -S PDS5_Merge/PDS5B_WT_Merge_NLA_ChIP17.fastq.gz.bw PDS5_Merge/PDS5B_5A-KO_Merge_NLA_ChIP17.fastq.gz.bw PDS5B-WT_A-KO-Sub.bw -R Intersect/PDS5B_WT_A-KO_union-sort_unique-shrink.bed  -a 2500 -b 2500 -out PDS5B_WT_A-KO-Subtract.mat.gz -p 24 -bs 10 --missingDataAsZero

#plotHeatmap -m PDS5B_WT_A-KO-Subtract.mat.gz --sortUsing max --colorMap Purples Greys cool --whatToShow 'plot, heatmap and colorbar'  --refPointLabel "Peak Center" --heatmapHeight 25 -min 0 0 "-5" -max 20 20 10 --kmeans 4 --heatmapWidth 4  --yAxisLabel "PDS5B Merge Peaks" --sortRegions descend --missingDataColor "#FFFFFF" --dpi 1000 --plotFileFormat pdf --outFileName Plots/PDS5B_WT_A-KO-Subtract.plot3.pdf


#bigwigCompare -b1 PDS5_Merge/PDS5A_5B-KO_Merge_NLA_ChIP17.fastq.gz.bw -b2 PDS5_Merge/PDS5A_WT_Merge_NLA_ChIP17.fastq.gz.bw --operation subtract --outFileName PDS5A-WT_B-KO-Sub.bw

#computeMatrix reference-point -S PDS5_Merge/PDS5A_WT_Merge_NLA_ChIP17.fastq.gz.bw PDS5_Merge/PDS5A_5B-KO_Merge_NLA_ChIP17.fastq.gz.bw PDS5A-WT_B-KO-Sub.bw -R Intersect/PDS5A_WT_B-KO_union-sort_unique-shrink.bed  -a 2500 -b 2500 -out PDS5A_WT_B-KO-Subtract.mat.gz -p 24 -bs 10 --missingDataAsZero

plotHeatmap -m PDS5A_WT_B-KO-Subtract.mat.gz --sortUsing max --colorMap Oranges Greys bwr --whatToShow 'plot, heatmap and colorbar'  --refPointLabel "Peak Center" --heatmapHeight 25 -min 0 0 "-5" -max 30 30 20 --heatmapWidth 4  --yAxisLabel "PDS5A Merge Peaks" --sortRegions descend --missingDataColor "#FFFFFF" --dpi 1000 --plotFileFormat pdf --outFileName Plots/PDS5A_WT_B-KO-Subtract.plot.pdf  



