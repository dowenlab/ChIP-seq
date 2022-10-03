### Trying DiffBind ###
#http://bioconductor.org/packages/release/bioc/vignettes/DiffBind/inst/doc/DiffBind.pdf
## Install DiffBind (only once) ##

library("DiffBind")
library("DESeq2")

## Go to the location with files of interest
setwd("~/Desktop/DiffBind_PDS5")

## Read in the sample sheet ##
#make sure to first open file in R and add a space (click enter) after the last line - don't know why but it works
samples <- read.csv("5A_siB_5A_siG_table.csv")
names(samples)

## Read in the peak lists ## 
peaks <- dba(sampleSheet = "5A_siB_5A_siG_table.csv")

## Make a plot to see the correlations of peaks called ##
plot(peaks)

## Count reads to get an affinity score. This is to calculate a binding matrix with scores based on read counts for every sample rather than confidence scores for only peaks called in a specific sample
#add  summits = 200 for extra extension
DBA_Table <- dba(sampleSheet = "5A_siB_5A_siG_table.csv")
DBA_Table <- dba.count(DBA_Table, summits = 200)
DBA_Table
plot(DBA_Table)

## Tell DiffBind which cell lines fall in which groups ##
DBA_Table <- dba.contrast(DBA_Table, categories = DBA_CONDITION, minMembers = 2)
DBA_Table

## Perform differential analysis ##
DBA_Table <- dba.analyze(DBA_Table)


## Retrieve differntially bound sites ##
#use th=1 instead of bUsePval=0.05 to get consensus list, gives all peaks without a cutoff specification
DBA_Table.DB <- dba.report(DBA_Table, th=1, contrast=1)
DBA_Table.DB
write.table(DBA_Table.DB, "RAD21_5A_siB_5A_siG_ChIP16_consensus.txt")

#this gives you a table of only DB sites based on pvalue cutoff
DBA_Table.DB <- dba.report(DBA_Table, bUsePval = 0.05, contrast = 1)
DBA_Table.DB
write.table(DBA_Table.DB, "RAD21_5A_siB_5A_siG_ChIP16_DB.txt")

## Plot PCA ##
dba.plotPCA(DBA_Table, DBA_REPLICATE, label=DBA_CONDITION)

## Plot only Differentailly Bound Sites PCA ##
#Contrasts are comparisons!#
dba.plotPCA(DBA_Table, contrast=1, label=DBA_REPLICATE, bUsePval = 0.05 )



#change colors of MAplot#
crukBlue.save <- getFromNamespace("crukBlue", "DiffBind")
crukMagenta.save <- getFromNamespace("crukMagenta", "DiffBind")
assignInNamespace("crukBlue","black","DiffBind")
assignInNamespace("crukMagenta","red","DiffBind")
dba.plotMA(DBA_Table, bUsePval = 0.05, bSmooth=FALSE, yrange = c(-3,3),  contrast = 1)






##from vinette - not sure this works##
## Derive consensus peaksets ##
names(STAG_WT$masks)
olap.rate <- dba.overlap(STAG_WT, mode=DBA_OLAP_PEAKS, STAG_WT$masks$STAG1)
olap.rate

#The numbers are how many overlap in one dataset, two, three, etc.
dba.overlap(STAG_WT, mode=DBA_OLAP_RATE, STAG_WT$masks$STAG1)

## Plot a Venn diagram ##
dba.plotVenn(STAG_WT, STAG_WT$masks$STAG2)
