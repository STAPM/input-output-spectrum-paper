source("src/03_load_packages.R")

### This code writes out results to the output tables spreadsheet template

source("src/11_generate_inputs.R")
source("src/31_read_baseline.R")
source("src/32_read_main_results.R")
source("src/33_read_sectoral_results.R")
source("src/34_read_additional_main_results.R")
source("src/35_read_main_results_no_reallocation.R")

### fill in the workbook

wb <- openxlsx::loadWorkbook("output/templates/output_tables_template_AUGUST25.xlsx")

#################################
### TABLE 1 - BASELINE

openxlsx::writeData(wb,x = alcohol_base_lvl_output[1],         startCol = 2, startRow = 3,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = alcohol_base_lvl_inc_tax_nics[1],   startCol = 2, startRow = 4,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = alcohol_base_lvl_tax[1],            startCol = 2, startRow = 5,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = alcohol_base_lvl_fte[1],            startCol = 2, startRow = 6,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = alcohol_base_lvl_net_earn[1],       startCol = 2, startRow = 7,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = alcohol_base_lvl_gva[1],            startCol = 2, startRow = 8,  sheet = "TAB1_baseline")

openxlsx::writeData(wb,x = tobacco_base_lvl_output[1],         startCol = 3, startRow = 3,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = tobacco_base_lvl_inc_tax_nics[1],   startCol = 3, startRow = 4,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = tobacco_base_lvl_tax[1],            startCol = 3, startRow = 5,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = tobacco_base_lvl_fte[1],            startCol = 3, startRow = 6,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = tobacco_base_lvl_net_earn[1],       startCol = 3, startRow = 7,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = tobacco_base_lvl_gva[1],            startCol = 3, startRow = 8,  sheet = "TAB1_baseline")

openxlsx::writeData(wb,x = food_base_lvl_output[1],         startCol = 4, startRow = 3,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = food_base_lvl_inc_tax_nics[1],   startCol = 4, startRow = 4,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = food_base_lvl_tax[1],            startCol = 4, startRow = 5,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = food_base_lvl_fte[1],            startCol = 4, startRow = 6,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = food_base_lvl_net_earn[1],       startCol = 4, startRow = 7,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = food_base_lvl_gva[1],            startCol = 4, startRow = 8,  sheet = "TAB1_baseline")

openxlsx::writeData(wb,x = gambling_base_lvl_output[1],         startCol = 5, startRow = 3,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = gambling_base_lvl_inc_tax_nics[1],   startCol = 5, startRow = 4,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = gambling_base_lvl_tax[1],            startCol = 5, startRow = 5,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = gambling_base_lvl_fte[1],            startCol = 5, startRow = 6,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = gambling_base_lvl_net_earn[1],       startCol = 5, startRow = 7,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = gambling_base_lvl_gva[1],            startCol = 5, startRow = 8,  sheet = "TAB1_baseline")


openxlsx::writeData(wb,x = baseline[1],   startCol = 6, startRow = 3,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = baseline[6],   startCol = 6, startRow = 4,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = baseline[3],   startCol = 6, startRow = 5,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = baseline[4],   startCol = 6, startRow = 6,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = baseline[5],   startCol = 6, startRow = 7,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = baseline[2],   startCol = 6, startRow = 8,  sheet = "TAB1_baseline")

openxlsx::writeData(wb,x = perc_base_output,         startCol = 7, startRow = 3,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = perc_base_inc_tax_nics,   startCol = 7, startRow = 4,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = perc_base_tax,            startCol = 7, startRow = 5,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = perc_base_fte,            startCol = 7, startRow = 6,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = perc_base_net_earn,       startCol = 7, startRow = 7,  sheet = "TAB1_baseline")
openxlsx::writeData(wb,x = perc_base_gva,            startCol = 7, startRow = 8,  sheet = "TAB1_baseline")

################################################
### TABLE 2 - MAIN RESULTS

## alcohol
openxlsx::writeData(wb,x = alcohol_lvl_output,       startCol = 2, startRow = 6,   sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_inc_tax_nics, startCol = 2, startRow = 10,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_tax,          startCol = 2, startRow = 14,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_fte,          startCol = 2, startRow = 18,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_net_earn,     startCol = 2, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_gva,          startCol = 2, startRow = 26,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = alcohol_pct_output,       startCol = 6, startRow = 6,   sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_inc_tax_nics, startCol = 6, startRow = 10,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_tax,          startCol = 6, startRow = 14,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_fte,          startCol = 6, startRow = 18,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_net_earn,     startCol = 6, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_gva,          startCol = 6, startRow = 26,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)

## tobacco
openxlsx::writeData(wb,x = tobacco_lvl_output,       startCol = 3, startRow = 6,   sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_inc_tax_nics, startCol = 3, startRow = 10,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_tax,          startCol = 3, startRow = 14,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_fte,          startCol = 3, startRow = 18,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_net_earn,     startCol = 3, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_gva,          startCol = 3, startRow = 26,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = tobacco_pct_output,       startCol = 7, startRow = 6,   sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_inc_tax_nics, startCol = 7, startRow = 10,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_tax,          startCol = 7, startRow = 14,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_fte,          startCol = 7, startRow = 18,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_net_earn,     startCol = 7, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_gva,          startCol = 7, startRow = 26,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)

## food
openxlsx::writeData(wb,x = food_lvl_output,       startCol = 4, startRow = 6,   sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_inc_tax_nics, startCol = 4, startRow = 10,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_tax,          startCol = 4, startRow = 14,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_fte,          startCol = 4, startRow = 18,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_net_earn,     startCol = 4, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_gva,          startCol = 4, startRow = 26,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = food_pct_output,       startCol = 8, startRow = 6,   sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_inc_tax_nics, startCol = 8, startRow = 10,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_tax,          startCol = 8, startRow = 14,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_fte,          startCol = 8, startRow = 18,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_net_earn,     startCol = 8, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_gva,          startCol = 8, startRow = 26,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)

## gambling
openxlsx::writeData(wb,x = gambling_lvl_output,       startCol = 5, startRow = 6,   sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_inc_tax_nics, startCol = 5, startRow = 10,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_tax,          startCol = 5, startRow = 14,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_fte,          startCol = 5, startRow = 18,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_net_earn,     startCol = 5, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_gva,          startCol = 5, startRow = 26,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = gambling_pct_output,       startCol = 9, startRow = 6,   sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_inc_tax_nics, startCol = 9, startRow = 10,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_tax,          startCol = 9, startRow = 14,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_fte,          startCol = 9, startRow = 18,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_net_earn,     startCol = 9, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_gva,          startCol = 9, startRow = 26,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)

################################################
### TABLE 3 - MAIN RESULTS FOR GVA BY SECTOR

openxlsx::writeData(wb,x = sector_results_final[,2:5], startCol = 2, startRow = 4,  sheet = "TAB3_results_by_sector", rowNames = FALSE, colNames = FALSE)

###################################################
### TABLE 2 - MAIN RESULTS - without reallocation

## alcohol
openxlsx::writeData(wb,x = alcohol_lvl_output_no_r,       startCol = 2, startRow = 6,   sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_inc_tax_nics_no_r, startCol = 2, startRow = 10,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_tax_no_r,          startCol = 2, startRow = 14,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_fte_no_r,          startCol = 2, startRow = 18,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_net_earn_no_r,     startCol = 2, startRow = 22,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_gva_no_r,          startCol = 2, startRow = 26,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = alcohol_pct_output_no_r,       startCol = 6, startRow = 6,   sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_inc_tax_nics_no_r, startCol = 6, startRow = 10,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_tax_no_r,          startCol = 6, startRow = 14,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_fte_no_r,          startCol = 6, startRow = 18,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_net_earn_no_r,     startCol = 6, startRow = 22,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_gva_no_r,          startCol = 6, startRow = 26,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)

## tobacco
openxlsx::writeData(wb,x = tobacco_lvl_output_no_r,       startCol = 3, startRow = 6,   sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_inc_tax_nics_no_r, startCol = 3, startRow = 10,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_tax_no_r,          startCol = 3, startRow = 14,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_fte_no_r,          startCol = 3, startRow = 18,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_net_earn_no_r,     startCol = 3, startRow = 22,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_gva_no_r,          startCol = 3, startRow = 26,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = tobacco_pct_output_no_r,       startCol = 7, startRow = 6,   sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_inc_tax_nics_no_r, startCol = 7, startRow = 10,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_tax_no_r,          startCol = 7, startRow = 14,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_fte_no_r,          startCol = 7, startRow = 18,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_net_earn_no_r,     startCol = 7, startRow = 22,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_gva_no_r,          startCol = 7, startRow = 26,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)

## food
openxlsx::writeData(wb,x = food_lvl_output_no_r,       startCol = 4, startRow = 6,   sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_inc_tax_nics_no_r, startCol = 4, startRow = 10,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_tax_no_r,          startCol = 4, startRow = 14,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_fte_no_r,          startCol = 4, startRow = 18,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_net_earn_no_r,     startCol = 4, startRow = 22,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_gva_no_r,          startCol = 4, startRow = 26,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = food_pct_output_no_r,       startCol = 8, startRow = 6,   sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_inc_tax_nics_no_r, startCol = 8, startRow = 10,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_tax_no_r,          startCol = 8, startRow = 14,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_fte_no_r,          startCol = 8, startRow = 18,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_net_earn_no_r,     startCol = 8, startRow = 22,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_gva_no_r,          startCol = 8, startRow = 26,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)

## gambling
openxlsx::writeData(wb,x = gambling_lvl_output_no_r,       startCol = 5, startRow = 6,   sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_inc_tax_nics_no_r, startCol = 5, startRow = 10,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_tax_no_r,          startCol = 5, startRow = 14,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_fte_no_r,          startCol = 5, startRow = 18,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_net_earn_no_r,     startCol = 5, startRow = 22,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_gva_no_r,          startCol = 5, startRow = 26,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = gambling_pct_output_no_r,       startCol = 9, startRow = 6,   sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_inc_tax_nics_no_r, startCol = 9, startRow = 10,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_tax_no_r,          startCol = 9, startRow = 14,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_fte_no_r,          startCol = 9, startRow = 18,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_net_earn_no_r,     startCol = 9, startRow = 22,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_gva_no_r,          startCol = 9, startRow = 26,  sheet = "TAB2_main_results_no_reallocate", rowNames = FALSE, colNames = FALSE)


#########################################################
### TABLE 2 - EXTRA RESULTS - ALCOHOL DISAGGREGATION

## alcohol
openxlsx::writeData(wb,x = alcohol_lvl_output,       startCol = 2, startRow = 6,   sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_inc_tax_nics, startCol = 2, startRow = 10,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_tax,          startCol = 2, startRow = 14,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_fte,          startCol = 2, startRow = 18,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_net_earn,     startCol = 2, startRow = 22,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_gva,          startCol = 2, startRow = 26,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = alcohol_pct_output,       startCol = 5, startRow = 6,   sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_inc_tax_nics, startCol = 5, startRow = 10,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_tax,          startCol = 5, startRow = 14,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_fte,          startCol = 5, startRow = 18,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_net_earn,     startCol = 5, startRow = 22,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_gva,          startCol = 5, startRow = 26,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)

## alcohol on-trade
openxlsx::writeData(wb,x = alcohol_on_lvl_output,       startCol = 3, startRow = 6,   sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_lvl_inc_tax_nics, startCol = 3, startRow = 10,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_lvl_tax,          startCol = 3, startRow = 14,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_lvl_fte,          startCol = 3, startRow = 18,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_lvl_net_earn,     startCol = 3, startRow = 22,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_lvl_gva,          startCol = 3, startRow = 26,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = alcohol_on_pct_output,       startCol = 6, startRow = 6,   sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_pct_inc_tax_nics, startCol = 6, startRow = 10,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_pct_tax,          startCol = 6, startRow = 14,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_pct_fte,          startCol = 6, startRow = 18,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_pct_net_earn,     startCol = 6, startRow = 22,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_on_pct_gva,          startCol = 6, startRow = 26,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)


## alcohol off-trade
openxlsx::writeData(wb,x = alcohol_off_lvl_output,       startCol = 4, startRow = 6,   sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_lvl_inc_tax_nics, startCol = 4, startRow = 10,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_lvl_tax,          startCol = 4, startRow = 14,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_lvl_fte,          startCol = 4, startRow = 18,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_lvl_net_earn,     startCol = 4, startRow = 22,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_lvl_gva,          startCol = 4, startRow = 26,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = alcohol_off_pct_output,       startCol = 7, startRow = 6,   sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_pct_inc_tax_nics, startCol = 7, startRow = 10,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_pct_tax,          startCol = 7, startRow = 14,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_pct_fte,          startCol = 7, startRow = 18,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_pct_net_earn,     startCol = 7, startRow = 22,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_off_pct_gva,          startCol = 7, startRow = 26,  sheet = "TAB2_alcohol_breakdown", rowNames = FALSE, colNames = FALSE)

################################################################
### TABLE 2 - EXTRA RESULTS - TOBACCO PLUS GOVERNMENT SPENDING

## tobacco
openxlsx::writeData(wb,x = tobacco_lvl_output,       startCol = 2, startRow = 6,   sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_inc_tax_nics, startCol = 2, startRow = 10,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_tax,          startCol = 2, startRow = 14,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_fte,          startCol = 2, startRow = 18,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_net_earn,     startCol = 2, startRow = 22,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_gva,          startCol = 2, startRow = 26,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = tobacco_pct_output,       startCol = 4, startRow = 6,   sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_inc_tax_nics, startCol = 4, startRow = 10,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_tax,          startCol = 4, startRow = 14,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_fte,          startCol = 4, startRow = 18,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_net_earn,     startCol = 4, startRow = 22,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_gva,          startCol = 4, startRow = 26,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)


## tobacco (plus govt spending)
openxlsx::writeData(wb,x = tobacco_plus_govt_lvl_output,       startCol = 3, startRow = 6,   sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_lvl_inc_tax_nics, startCol = 3, startRow = 10,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_lvl_tax,          startCol = 3, startRow = 14,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_lvl_fte,          startCol = 3, startRow = 18,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_lvl_net_earn,     startCol = 3, startRow = 22,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_lvl_gva,          startCol = 3, startRow = 26,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = tobacco_plus_govt_pct_output,       startCol = 5, startRow = 6,   sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_pct_inc_tax_nics, startCol = 5, startRow = 10,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_pct_tax,          startCol = 5, startRow = 14,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_pct_fte,          startCol = 5, startRow = 18,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_pct_net_earn,     startCol = 5, startRow = 22,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_plus_govt_pct_gva,          startCol = 5, startRow = 26,  sheet = "TAB2_include_extra_govt_spend", rowNames = FALSE, colNames = FALSE)


##### WRITE OUT RESULTS

saveWorkbook(wb,paste0("output/results_tables.xlsx"), overwrite = T)
