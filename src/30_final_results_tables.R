
### This code writes out results to the output tables spreadsheet template

source("src/11_generate_inputs.R")
source("src/31_read_baseline.R")
source("src/32_read_main_results.R")
source("src/33_read_sectoral_results.R")

### fill in the workbook

wb <- openxlsx::loadWorkbook("output/templates/output_tables_template_MARCH25.xlsx")

#################################
### TABLE 0 - SCENARIO INPUTS

openxlsx::writeData(wb,x = alcohol_inputs,   startCol = 2, startRow = 5,  sheet = "TAB0_scenario_inputs")
openxlsx::writeData(wb,x = tobacco_l_inputs, startCol = 3, startRow = 6,  sheet = "TAB0_scenario_inputs")
openxlsx::writeData(wb,x = tobacco_i_inputs, startCol = 3, startRow = 7,  sheet = "TAB0_scenario_inputs")
openxlsx::writeData(wb,x = food_inputs,      startCol = 4, startRow = 14, sheet = "TAB0_scenario_inputs")
openxlsx::writeData(wb,x = gambling_inputs,  startCol = 5, startRow = 15, sheet = "TAB0_scenario_inputs")

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
### TABLE 2 - MAIN RESULTS (UPDATED VERSION)

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
openxlsx::writeData(wb,x = food_lvl_net_earn,     startCol = 3, startRow = 22,  sheet = "TAB2_main_results_new", rowNames = FALSE, colNames = FALSE)
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


##### WRITE OUT RESULTS

saveWorkbook(wb,paste0("output/results_tables.xlsx"), overwrite = T)
