# PROLOG   ##############################################################################

# PROJECT: Seed Rain Methods
# PURPOSE: Data cleaning 
#
# AUTHORS: Lauren Sullivan (llsull@msu.edu) & Lauren Shoemaker (lshoema1@uwyo.edu)
# COLLAB:  Melissa DeSiervo, Larissa Kahan
# EDITED:  1 February 2025
#
# FILES:   1) data/L0/MO_seedrain_raw.csv
#          2) data/L0/CO_seedrain_raw.xlsx
#

# NOTES:   creates "strict" datasets where we just focus on the species of interest 
#             not herbivory or other species that were collected in the traps

# PROLOG   ##############################################################################



## clear workspace
rm(list=ls())

## working directory
#set working directory to "source file location"

## libraries
library(tidyverse)
library(RColorBrewer)
library(cowplot)

## data
mo <- read_csv("../data/L0/MO_seedrain_raw.csv")

co <- read_csv("../data/L0/CO_seedrain_raw.csv")


#### MISSORI DATA CLEANING
## clean up treatment names and times

mo$time_month[mo$time_month == '1 month'] <- 1
mo$time_month[mo$time_month == '2 month'] <- 2
mo$time_month[mo$time_month == '1 week'] <- 0.25

mo$time_month <- as.numeric(mo$time_month)
#list(unique(mo$treatment))
#list(unique(mo$time_month))


## clean data to just be the species we selected, not the extra 
##      seeds we caught throughout the experiment

mo_slim <- mo %>%
  filter(species == "LESCAP" | species == "DESCAN" | species == "TRIPER" |
         species == "SCHSCO" | species == "ECHANG" | species == "SPOHET" |
         species == "RUDHIR" | species == "CORTIN")


#### COLORADO DATA CLEANING
## clean up treatment names and times

co$treatment[co$treatment == 's'] <- "sticky"
co$treatment[co$treatment == 'c'] <- "carpet"

#list(unique(co$treatment))
#list(unique(mo$time_month))

## clean data to just be the species we selected, not the extra 
##      seeds we caught throughout the experiment

list(unique(co$species))

co_slim <- co %>%
  filter(species != ("various"))


## Create full dataset with both sites

dat_all <- full_join(mo_slim, co_slim)


## create a %consumed column

dat_all$pct_recovered <- dat_all$number_recovered/dat_all$number_original

dat_all$time_month <- as.factor(dat_all$time_month)



#### FIGURES



## some exploratory data analysis
##MO


mo_raw <- dat_all %>%
  filter(site == "mo" & treatment != "post-sticky") %>%
ggplot( aes(x = time_month, y = pct_recovered, color = treatment))+
  geom_boxplot()+
  facet_grid(cols = vars(species))+
  scale_color_brewer(palette = "Set1")+
  theme_bw()

co_raw <- dat_all %>%
  filter(site == "co") %>%
  ggplot(aes(x = time_month, y = pct_recovered, color = treatment))+
  geom_boxplot()+
  facet_grid(cols = vars(species))+
  scale_color_brewer(palette = "Set1")+
  theme_bw()


#note: will clean this up as we go forward but not important for now.
pdf("../figures/all_raw_data.pdf", width = 10, height = 8)

plot_grid(mo_raw, co_raw, ncol = 1, labels = c("A)", "B)"))

dev.off()




## ok make relativized plot with carpet compared to sticky.

head(dat_all)

dat_small <- dat_all[,1:8]
dat_small <- subset(dat_small, treatment != "post-sticky")
head(dat_small)


dat_wide <- dat_small %>%
  pivot_wider(
    names_from = treatment,
    values_from = number_recovered
  )
head(dat_wide)

dat_wide$rel_removed <- dat_wide$sticky - dat_wide$carpet


mo_rel <- ggplot(subset(dat_wide, site == "mo"), aes(x = time_month, y = rel_removed))+
  geom_boxplot()+
  #geom_point(position = position_jitter(width = 0.2))+
  geom_hline(yintercept = 0, linetype = "dashed", color = "red")+
  facet_grid(cols = vars(species))+
  scale_color_brewer(palette = "Set1")+
  theme_bw()

co_rel <- ggplot(subset(dat_wide, site == "co"), aes(x = time_month, y = rel_removed))+
  #geom_point(position = position_jitter(width = 0.2))+
  geom_boxplot()+
  geom_hline(yintercept = 0, linetype = "dashed", color = "red")+
  facet_grid(cols = vars(species))+
  scale_color_brewer(palette = "Set1")+
  theme_bw()

#note: will clean this up as we go forward but not important for now.
pdf("../figures/all_relative_data.pdf", width = 10, height = 8)

plot_grid(mo_rel, co_rel, ncol = 1, labels = c("A)", "B)"))

dev.off()






