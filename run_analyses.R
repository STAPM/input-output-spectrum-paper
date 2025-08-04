## This meta-file runs all R code to produce the analysis

##-------------- Preamble --------------##
#source("src/01_install_packages.R") # install the model
source("src/03_load_packages.R")

##-------------- Main Analysis --------------##

## main analyses
source("src/11_generate_inputs.R")
source("src/12_model_baseline.R")
source("src/13a_generate_main_analyses.R")
source("src/13b_generate_extra_analyses.R")
source("src/13c_generate_main_analyses_no_reallocate.R")
source("src/14_generate_multipliers.R")
source("src/15_multipliers_and_reallocated_spending.R")

##----------- Sensitivity Analyses ----------##
source("src/21_sensitivity_analysis_io_table.R")
source("src/22_sensitivity_analysis_reallocation_rate.R")
source("src/23_sensitivity_analysis_reallocation_target.R")

##-------------- Outputs --------------##
source("src/30_final_results_tables.R")
