## This meta-file runs all R code to produce the analysis

##-------------- Preamble --------------##
source("src/03_load_packages.R")

##-------------- Analysis --------------##

## main analyses
source("src/11_generate_inputs.R")
source("src/12_generate_analyses.R")
source("src/13_generate_multipliers.R")

## sensitivity analysese
source("src/15_sensitivity_analysis_reallocation.R")
source("src/16_sensitivity_analysis_io_table.R")

##-------------- Outputs --------------##
source("src/25_final_results_tables.R")
