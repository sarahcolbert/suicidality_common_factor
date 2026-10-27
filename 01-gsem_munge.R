# Author: Sarah Colbert
# Title:  Use munge function in GSEM to clean sumstats for LDSC

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
################# MUNGING ##################
############################################

## set up variables
in_dir <- "/[REDACTED]/"

## make vector with sumstats files
files <- c(paste0(in_dir, "[REDACTED].gz"),
           paste0(in_dir, "[REDACTED].gz"),
           paste0(in_dir, "[REDACTED].gz"))

## define ref file for aligning alleles (this is publicly available on gsem github)
hm3 <- "/[REDACTED]/ldsc/w_hm3.snplist"

## name traits
trait.names <- c("SI", "SA", "SD")

## list sample sizes (use NA because we have a per-SNP NEFF column in the summary stats files)
N=c(NA, NA, NA)

## define imputation quality filter (this is the default in gsem)
info.filter <- 0.9

## define MAF filter (this is the default in gsem)
maf.filter <- 0.01

## run munge with all default settings (files save automatically with trait names in the working dir)
munge(files=files,hm3=hm3,trait.names=trait.names,N=N,info.filter=info.filter,maf.filter=maf.filter)


