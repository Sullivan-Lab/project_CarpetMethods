# PROLOG   ##############################################################################

# PROJECT: Seed Rain Methods
# PURPOSE: Data cleaning 
#
# AUTHORS: Lauren Sullivan (llsull@msu.edu) & Lauren Shoemaker (lshoema1@uwyo.edu)
# COLLAB:  Melissa DeSiervo, Larissa Kahan
# EDITED:  22 January 2025
#
# FILES:   1) data/L0/MO_seedrain_raw.csv
#          2) data/L0/CO_seedrain_raw.xlsx
#

# NOTES:   creates "strict" datasets where we just focus on the species of interest 
#             not herbivory or other species that were collected in the traps

# PROLOG   ##############################################################################



## clear workspace
rm(list=ls())

#set working directory to "source file location"

## libraries
library(tidyverse)


## data
mo <- read_csv("../data/L0/MO_seedrain_raw.csv")

co <- read_csv("../data/L0/CO_seedrain_raw.csv")


## clean data to just be the species we selected

mo_slim <- mo %>%
            filter(species == c("LESCAP", "DESCAN", "TRIPER", 
                                "SCHSCO", "ECHANG", "SPOHET",
                                "RUDHIR", "CORTIN"))


head(mo_slim)
