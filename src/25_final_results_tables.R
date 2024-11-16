
### This code writes out results to the output tables spreadsheet template

wb <- openxlsx::loadWorkbook("output/templates/output_tables_template.xlsx")

#################################
### TABLE 1 - SCENARIO INPUTS

openxlsx::writeData(wb,x = alcohol_inputs,   startCol = 2, startRow = 5,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = tobacco_l_inputs, startCol = 3, startRow = 6,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = tobacco_i_inputs, startCol = 3, startRow = 7,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = food_inputs,      startCol = 4, startRow = 14, sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = gambling_inputs,  startCol = 5, startRow = 15, sheet = "TAB1_scenario_inputs")

##########################################
### TABLE 2 - REALLOCATION OF SPENDING

openxlsx::writeData(wb,x = reallocate_output_multipliers, startCol = 2, startRow = 3,  sheet = "TAB2_reallocation", colNames = FALSE)
openxlsx::writeData(wb,x = reallocate_gva_multipliers,    startCol = 2, startRow = 4,  sheet = "TAB2_reallocation", colNames = FALSE)
openxlsx::writeData(wb,x = reallocate_supply_ratio,       startCol = 2, startRow = 5,  sheet = "TAB2_reallocation", colNames = FALSE)

##############################
### TABLE 3 - MAIN RESULTS (ORIGINAL VERSION)

## alcohol
openxlsx::writeData(wb,x = alcohol_lvl_type0,   startCol = 2, startRow = 5,   sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_type1,   startCol = 2, startRow = 12,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_type2,   startCol = 2, startRow = 19,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = alcohol_pct_type0,   startCol = 3, startRow = 5,   sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_type1,   startCol = 3, startRow = 12,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_type2,   startCol = 3, startRow = 19,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)

## tobacco
openxlsx::writeData(wb,x = tobacco_lvl_type0,   startCol = 4, startRow = 5,   sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_type1,   startCol = 4, startRow = 12,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_type2,   startCol = 4, startRow = 19,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = tobacco_pct_type0,   startCol = 5, startRow = 5,   sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_type1,   startCol = 5, startRow = 12,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_type2,   startCol = 5, startRow = 19,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)

## food
openxlsx::writeData(wb,x = food_lvl_type0,   startCol = 6, startRow = 5,   sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_type1,   startCol = 6, startRow = 12,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_type2,   startCol = 6, startRow = 19,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = food_pct_type0,   startCol = 7, startRow = 5,   sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_type1,   startCol = 7, startRow = 12,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_type2,   startCol = 7, startRow = 19,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)

## gambling
openxlsx::writeData(wb,x = gambling_lvl_type0,   startCol = 8, startRow = 5,   sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_type1,   startCol = 8, startRow = 12,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_type2,   startCol = 8, startRow = 19,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = gambling_pct_type0,   startCol = 9, startRow = 5,   sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_type1,   startCol = 9, startRow = 12,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_type2,   startCol = 9, startRow = 19,  sheet = "TAB3_main_results", rowNames = FALSE, colNames = FALSE)


##############################
### TABLE 3 - MAIN RESULTS (UPDATED VERSION)

## alcohol
openxlsx::writeData(wb,x = alcohol_lvl_output,       startCol = 2, startRow = 6,   sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_gva,          startCol = 2, startRow = 10,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_tax,          startCol = 2, startRow = 14,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_fte,          startCol = 2, startRow = 18,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_net_earn,     startCol = 2, startRow = 22,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_inc_tax_nics, startCol = 2, startRow = 26,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = alcohol_pct_output,       startCol = 6, startRow = 6,   sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_gva,          startCol = 6, startRow = 10,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_tax,          startCol = 6, startRow = 14,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_fte,          startCol = 6, startRow = 18,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_net_earn,     startCol = 6, startRow = 22,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_inc_tax_nics, startCol = 6, startRow = 26,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)

## tobacco
openxlsx::writeData(wb,x = tobacco_lvl_output,       startCol = 3, startRow = 6,   sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_gva,          startCol = 3, startRow = 10,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_tax,          startCol = 3, startRow = 14,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_fte,          startCol = 3, startRow = 18,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_net_earn,     startCol = 3, startRow = 22,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_inc_tax_nics, startCol = 3, startRow = 26,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = tobacco_pct_output,       startCol = 7, startRow = 6,   sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_gva,          startCol = 7, startRow = 10,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_tax,          startCol = 7, startRow = 14,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_fte,          startCol = 7, startRow = 18,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_net_earn,     startCol = 7, startRow = 22,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_inc_tax_nics, startCol = 7, startRow = 26,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)

## food
openxlsx::writeData(wb,x = food_lvl_output,       startCol = 4, startRow = 6,   sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_gva,          startCol = 4, startRow = 10,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_tax,          startCol = 4, startRow = 14,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_fte,          startCol = 4, startRow = 18,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_net_earn,     startCol = 3, startRow = 22,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_inc_tax_nics, startCol = 4, startRow = 26,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = food_pct_output,       startCol = 8, startRow = 6,   sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_gva,          startCol = 8, startRow = 10,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_tax,          startCol = 8, startRow = 14,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_fte,          startCol = 8, startRow = 18,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_net_earn,     startCol = 8, startRow = 22,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_inc_tax_nics, startCol = 8, startRow = 26,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)

## gambling
openxlsx::writeData(wb,x = gambling_lvl_output,       startCol = 5, startRow = 6,   sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_gva,          startCol = 5, startRow = 10,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_tax,          startCol = 5, startRow = 14,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_fte,          startCol = 5, startRow = 18,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_net_earn,     startCol = 5, startRow = 22,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_inc_tax_nics, startCol = 5, startRow = 26,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = gambling_pct_output,       startCol = 9, startRow = 6,   sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_gva,          startCol = 9, startRow = 10,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_tax,          startCol = 9, startRow = 14,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_fte,          startCol = 9, startRow = 18,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_net_earn,     startCol = 9, startRow = 22,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_inc_tax_nics, startCol = 9, startRow = 26,  sheet = "TAB3_main_results_new", rowNames = FALSE, colNames = FALSE)

##### WRITE OUT RESULTS

saveWorkbook(wb,paste0("output/results_tables.xlsx"), overwrite = T)
