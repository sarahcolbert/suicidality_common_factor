# Author: Sarah Colbert
# Title:  Run common factor SEM

############################################
############## loading/setup ###############
############################################

## load packages
library(dplyr)
library(data.table)
require(GenomicSEM)

## set date
date <- format(Sys.Date(), format = "%Y%m%d")

## set working directory
setwd("/[REDACTED]")

## load mv LDSC matrix
load("/[REDACTED]")

############################################
############### RUN SUI CF #################
############################################

## run using commonfactor function and default settings
SUI_CommonFactor <- commonfactor(covstruc = CF_LDSCoutput, estimation="DWLS")
## save
save(SUI_CommonFactor, file=paste0("/[REDACTED]",date,".RData"))

