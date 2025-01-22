# Version 0.0.1

#Clear existing data and graphics
rm(list=ls())
graphics.off()

# SOURCE ----

## Read configuration file
source("/home/imer/works/data.integration/config.R")
setwd(baseDir)

# DATA IMPORT ----

print("Reading REDCap data..")
redcapData <- read_csv(paste0(redcapDir,"/IMERTEST_DATA_2024-08-05_1319.csv"))

print("Reading CedAP data..")
cedap <- read_xlsx(paste0(cedapDir,"/Cedap arricchito 2023_v2.xlsx"))

# PREPROCESS REDCAP DATA ----

source("preprocess_redcap_data.R")

# NUMLOC generation ----

postfix=1:dim(redcapData)[1]
prefix=rep(Year, dim(redcapData)[1])
lenPostfix=max(str_length(postfix))
postfix_zero_padded=str_pad(postfix, width=lenPostfix, side="left", pad=0)
numloc=str_c(prefix, postfix_zero_padded)
redcapData$numloc=numloc

# REDCAP DATE FORMATTING ----

redcapData$birth_date=format(redcapData$birth_date, "%d/%m/%Y")
redcapData$death_date=format(redcapData$death_date, "%d/%m/%Y")
redcapData$datemo=format(redcapData$datemo, "%d/%m/%Y")
redcapData$agefa=format(redcapData$agefa, "%d/%m/%Y")

# REDCAP DATA SOURCE ----

redcapData$data_source=1




