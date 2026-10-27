# Author: Sarah Colbert
# Title:  Run common factor GWAS

############################################
############## loading/setup ###############
############################################

## load packages
library(dplyr)
library(data.table)
require(GenomicSEM)

## set date for version control
date <- format(Sys.Date(), format = "%Y%m%d")

## set working directory
setwd("/[REDACTED]")

## load mv LDSC matrix
load("/[REDACTED].RData")

## load output file from the sumstats prep function
sui_sumstats <- fread("/[REDACTED]", h = T)

## load argument for which chromosome to run (more efficient to split up into jobs 1-22)
## chromosome is supplied as an argument when this R script is run, like: 'Rscript 05-cf_gwas.R 22'
args <- commandArgs(trailingOnly = TRUE)
chr <- args[1]

############################################
############### RUN CF GWAS ################
############################################

## filter sumstats to only snps on chromosome # from above
sui_sumstats_set <- sui_sumstats %>% filter(CHR == chr)

## run the GWAS using gsem commonfactorGWAS function and default settings
sui_factor <- commonfactorGWAS(covstruc = CF_LDSCoutput, SNPs = sui_sumstats_set, estimation = "DWLS", cores = NULL, parallel = TRUE, GC="standard", MPI=FALSE)

## save the results
write.table(sui_factor, file = paste0("/[REDACTED]_",date,"_chr",chr,".txt"), row.names = F, quote = F)
system(paste0("gzip /[REDACTED]_",date,"_chr",chr,".txt"))
