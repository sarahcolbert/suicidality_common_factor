# Author: Sarah Colbert
# Title:  Prep summary statistics for common factor GWAS

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

############################################
############# PREP SUM STATS ###############
############################################

## set arguments
files <- c("/[REDACTED SI SUMSTATS FILE]", "/[REDACTED SA SUMSTATS FILE]", "/[REDACTED SD SUMSTATS FILE]")
ref <- "/[REDACTED]/reference.1000G.maf.0.005.txt.gz" ## this is publicly available on gsem wiki
trait.names <- c("SI", "SA", "SD")
se.logit <- c(T,T,T)
linprob <- c(F,F,F)
info.filter <- 0.6 ## 0.6 is the package default
maf.filter <- 0.01 ## 0.01 is the package default

## prep sumstats using gsem 'sumstats' function and all default settings
sui_sumstats <- sumstats(files=files,ref=ref,trait.names=trait.names,se.logit=se.logit,OLS=NULL,linprob=linprob,N=NULL,betas=NULL,info.filter=info.filter,maf.filter=maf.filter,keep.indel=FALSE,parallel=FALSE,cores=NULL)
## save
write.table(sui_sumstats, file=paste0("[REDACTED]_",date,".txt"), row.names = F, quote = F)
system(paste0("gzip [REDACTED]_",date,".txt"))

