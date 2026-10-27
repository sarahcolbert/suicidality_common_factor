# Author: Sarah Colbert
# Title:  Run MV LDSC in GSEM

############################################
############## loading/setup ###############
############################################

## load packages
library(dplyr)
library(data.table)
require(GenomicSEM)

## set working directory
setwd("/[REDACTED]")

## set date for version control
date <- format(Sys.Date(), format = "%Y%m%d")

############################################
############### MV LDSC SUI ################
############################################

## ld scores and weights folder (these are publicly available from the gsem or ldsc githubs)
ld <- "/[REDACTED]/ldsc/ref/eur_w_ld_chr/"
wld <- "/[REDACTED]/ldsc/ref/eur_w_ld_chr/"

## vector of sumstats
trait.names <- c("SI", "SA", "SD")
traits <- paste0(trait.names, ".sumstats.gz")

## set samp prev to 0.5 because we are using neff column from the sumstats
sample.prev <- c(.5,.5,.5)

## set pop prevs
population.prev <- c(0.09, ## SI
                     0.02, ## SA
                     0.002) ## SD

## run LDSC in gsem with all default options
CF_LDSCoutput <- ldsc(traits=traits,sample.prev=sample.prev,population.prev=population.prev,ld=ld,wld=wld,trait.names=trait.names)

## save output to use later
save(CF_LDSCoutput, file=paste0("[REDACTED]",date,".RData"))
