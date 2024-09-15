## This meta-file runs all R code to produce the analysis

##-------------- Preamble --------------##
source("src/03_load_packages.R")

##-------------- Analysis --------------##

## main analyses
source("src/11_generate_inputs.R")
source("src/12_generate_analyses.R")
source("src/13_generate_multipliers.R")

## sensitivity analyses
source("src/15_sensitivity_analysis_1_io_table.R")
source("src/16_sensitivity_analysis_2_reallocation_rate.R")
source("src/17_sensitivity_analysis_3_reallocation_target.R")

##-------------- Outputs --------------##
source("src/25_final_results_tables.R")
