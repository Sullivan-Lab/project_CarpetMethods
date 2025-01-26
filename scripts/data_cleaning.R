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


#### MISSORI DATA CLEANING
## clean up treatment names and times

mo$time_month[mo$time_month == '1 month'] <- 1
mo$time_month[mo$time_month == '2 month'] <- 2
mo$time_month[mo$time_month == '1 week'] <- 0.25

mo$time_month <- as.numeric(mo$time_month)
list(unique(mo$treatment))
list(unique(mo$time_month))


## clean data to just be the species we selected, not the extra 
##      seeds we caught throughout the experiment

mo_slim <- mo %>%
  filter(species == "LESCAP" | species == "DESCAN" | species == "TRIPER" |
         species == "SCHSCO" | species == "ECHANG" | species == "SPOHET" |
         species == "RUDHIR" | species == "CORTIN")

nrow(mo)
nrow(mo_slim)
#### COLORADO DATA CLEANING
## clean up treatment names and times

co$treatment[co$treatment == 's'] <- "sticky"
co$treatment[co$treatment == 'c'] <- "carpet"

list(unique(co$treatment))
list(unique(mo$time_month))

## clean data to just be the species we selected, not the extra 
##      seeds we caught throughout the experiment

list(unique(co$species))

co_slim <- co %>%
  filter(species != ("various"))


## Create full dataset with both sites

dat_all <- full_join(mo_slim, co_slim)
head(dat_all)
str(dat_all)
str(mo_slim)
str(co_slim)


## create a %consumed column

dat_all$pct_recovered <- dat_all$number_recovered/dat_all$number_original

dat_all$time_month <- as.factor(dat_all$time_month)



#### FIGURES

## some exploratory data analysis
dat_all %>%
  filter(site == "mo" & treatment != "post-sticky") %>%
ggplot( aes(x = time_month, y = pct_recovered, color = treatment))+
  geom_boxplot()+
  facet_grid(cols = vars(species))


dat_all %>%
  filter(site == "co") %>%
  ggplot(aes(x = time_month, y = pct_recovered, color = treatment))+
  geom_boxplot()+
  facet_grid(cols = vars(species))


