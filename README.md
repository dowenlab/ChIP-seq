######### descriptions of files in this directory: ##################


######### ChIP-seq analysis ###############

ChIPseq-NoSpikeIn.sh #ChIP-seq pipeline developed alongside the spike-in, but DOES NOT align human reads and DOES NOT account for spike-in control.

ChIP-seq-SpikeIn-Script.sh #ChIP-seq pipeline developed in Justice et al. 2020 to analyze data with human spike-in controls. this should point to the Merged Genome directory in this folder for the alignment

mm10.chrom.sizes #file needed to run ChIP-seq script to control for chromosome sizes

MergedGenomeforNormalization #directory containing the Merged Genome of mouse and human to align to for using spike-in datasets. Do not move - ChIP-seq script points to this directory path for alignment

RepeatSequence.bed #file needed to run ChIP-seq script to remove repetative sequences from the ChIP-seq peak outputs as these are mostly noise/insignificant 



######### Deeptools for downstream ChIP analysis ###########

AvgSignalPlot.sh #make average signal plots for ChIP-seq signal (.bw) at a reference peak list (.bed)

Correlation.sh #make a correlation plot between two genotypes at a shared peak list

DNA_loop_anchors.sh #make average signal plots for ChIP-seq signal (.bw) at DNA loop anchors. plotting based on sizes of the loops where -m is the average size. this average is for the ChIA-anchors_mm10_Dowen2014.bed, if plotting for different reference loops, need to recalculate the average size (GetAverage.sh)

Fingerprint.sh #make fingerprint plot for individual ChIP-seq replicates. need to use raw bam files from the ChIP pipeline. these also need to be indexed. samtools index the bam files first and make sure this is in the same folder as the bam

GetAverage.sh #command line directions for calculating the average size of a list of coordinates (start = column 2, stop = column 3)

Heatmapper.sh #make a heatmap of ChIP-seq signal at a designated peak list

Ins_Neighborhood.sh #make average signal plots for ChIP-seq signal (.bw) across insulated neighborhoods. plotting based on average size of the neighborhoods where -m is the average size calculated using GetAverage.sh

MACS_Broad.sh #re-running end of ChIP-seq pipeline to call broad peaks on a dataset

Meta-Gene.sh #make average signal plot for ChIP-seq signal at a meta-gene. Uses AllGenesBioMart_Strand_NoNA_FIX.bed as the reference list - NEED STRAND INFO

SubHeatmap.sh #make a subtraction heatmap of ChIP-seq signal at a designated peak list

zNorm.r #z-score normalize bigwig files, written by Spencer Nystrom in Dan McKay's lab. usage listed at the top of the script, run on command line. note: this mathematically UNDOES spike-in normalization...



######### Reference files ################

AllGenesBioMart_Strand_NoNA_FIX.bed #list of all gene coordinates for whole gene. can use to make a Meta-Gene plot

ChIA-anchors_mm10_Dowen2014.bed #coordinates for ChIA-PET anchors from Dowen et al. 2014

CTCF-merged_Justice2020.bed #coordinates for CTCF peaks from Justice et al. 2020. use for average signal plots and use extended version for overlaps with bedtools intersect

HiC-anchors_mm10_Justice2020.bed #coordinates for HiC WT loop anchors from Justice et al. 2020

InsulatedNeighborhoods-Dowen2014.bed #coordinates for insulated neighborhoods from Dowen et al. 2014. average size indicated by -m and calculated using GetAverage.sh

OSN-Merged_NO-TSS_Whyte2013.bed #coordinates for Oct4, Sox2, and Nanog from Whyte et al. 2013, used as our list of WT enhancers for mESCs. Use for a reference list for plots or use extended version to overlap using bedtools intersect

UCSC-TSS-mm10_PROMOTER-COORDS.bed #coordinates for gene promoters in mm10 from UCSC. use this for average signal plots at promoters and use extended version for overlaps with bedtools intersect




############ R Studio ##########
DiffBind.R #R script for using DiffBind. compares ChIP-seq between two conditions at a consensus SHARED peak list. makes MA plots of the data.

DiffBind_sample_table.csv #example input table for DiffBind samples. bam and bed files should be on desktop with full file paths listed




