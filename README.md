# Seed Rain Methods Comparison Between Astroturf and Sticky-traps


## Table of Contents
- [Introduction](#Introduction)
- [Workflow](#Workflow)
- [Location of data](#Location-of-data)
- [Spatiotemporal extent and resolution](#Spatiotemporal-extent-and-resolution)
- [Usage](#Usage)
- [File naming conventions](#File-naming-conventions)
- [License](#License)
- [Funding Sources](#Funding-sources)
- [Acknowledgements](#Acknowledgements)
- [Contributors](#Contributors)
- [Contact Information](#Contact-information)

## Introduction

[*This respository contains code for data cleaning and analysis of our seed rain methods work to determine how well the astroturf carpets capture and retain seeds as compared to the classic sticky trap method*]  

## Workflow

[*Download raw data, clean data with this code, then use this code to run analyses and create figures for the manuscript xxx*] 

## Location of data 

[*Dropbox*]

## Spatiotemporal extent and resolution 

[*Describe the spatial and temporal extent and resolution of the data sets resulting from the workflow. For example:*]  
- Spatial extent: [*2 sites - one in Colorado and one in Missouri near the University of Missouri*]
- Spatial resolution: [*2 sites*]
- Temporal extent: [*2019*]
- Temporal resolution: [*collection occurred at 1 week, 1 month and 2 month intervals*]

## Usage

[*R version 4.3.3, Rstudio version XXX*]

### File Naming Conventions

- **Data Files**: [*`state_datatype_raw.csv`.*]
- **Scripts**: [*To be run in order: `1_cleaning_script.R`, \2_analysis_script.R`*]

## Scripts

[*scripts are found in the main "Analysis" folder, and it accesses raw data from L0, cleaned data from L1, figures in "Figures".  First the data should be cleaned, and then the data can be analyzed.*] 

### [*`data_cleaning.R`*]

- **Purpose**: [*Cleans and preprocesses raw Level 0 data.*]
- **Inputs**: [*Raw data files in the `/data`> `/L0` folder (`MO_seedrain_raw.csv`, `CO_seedrain_raw.csv`).*]
- **Outputs**: [*Processed data files in a new folder (`/processed_data`).*]

### [*`data_analysis.R`*]

- **Purpose**: [*Merges multiple preprocessed datasets and analyzes data for xxx manuscript.*]
- **Inputs**: [*Processed data files in the `/processed_data` folder.*]
- **Outputs**: [*Merged dataset saved as `merged_data.csv` in the `/output` folder, and figures for the manuscript are saved in the `/figures` folder.*]

## Funding Sources
[*Startup to LLS and LGS provided by the University of Missouri and University of Wyoming.*]

## Acknowledgements
[*Kate Wynne and Maya Parker-Smith helped with MO data collection <LGS: add more!>*]

## Contributors

[*Lauren Sullivan and Lauren Shoemaker collected data, analyzed data, developed manuscript, Larissa Kahan and Melissa DeSiervo contributed to idea generation and manuscript writing. <LGS: add more!>*]

## Contact Information

[*Please contact Lauren Shoemaker (lshoema1@uwyo.edu) and Lauren Sullivan (llsull@msu.edu) re: questions about the scripts and data*]
