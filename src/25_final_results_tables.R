
### This code writes out results to the output tables spreadsheet template

wb <- openxlsx::loadWorkbook("output/templates/output_tables_template.xlsx")

### TABLE 1 - SCENARIO INPUTS

openxlsx::writeData(wb,x = alcohol_inputs,   startCol = 2, startRow = 5,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = tobacco_l_inputs, startCol = 3, startRow = 6,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = tobacco_i_inputs, startCol = 3, startRow = 7,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = food_inputs,      startCol = 4, startRow = 14, sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = gambling_inputs,  startCol = 5, startRow = 15, sheet = "TAB1_scenario_inputs")

### TABLE 2 - MAIN RESULTS

## alcohol
openxlsx::writeData(wb,x = alcohol_lvl_type0,   startCol = 2, startRow = 5,   sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_type1,   startCol = 2, startRow = 12,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_lvl_type2,   startCol = 2, startRow = 19,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = alcohol_pct_type0,   startCol = 3, startRow = 5,   sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_type1,   startCol = 3, startRow = 12,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = alcohol_pct_type2,   startCol = 3, startRow = 19,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)

## tobacco
openxlsx::writeData(wb,x = tobacco_lvl_type0,   startCol = 4, startRow = 5,   sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_type1,   startCol = 4, startRow = 12,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_lvl_type2,   startCol = 4, startRow = 19,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = tobacco_pct_type0,   startCol = 5, startRow = 5,   sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_type1,   startCol = 5, startRow = 12,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = tobacco_pct_type2,   startCol = 5, startRow = 19,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)

## food
openxlsx::writeData(wb,x = food_lvl_type0,   startCol = 6, startRow = 5,   sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_type1,   startCol = 6, startRow = 12,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_lvl_type2,   startCol = 6, startRow = 19,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = food_pct_type0,   startCol = 7, startRow = 5,   sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_type1,   startCol = 7, startRow = 12,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = food_pct_type2,   startCol = 7, startRow = 19,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)

## gambling
openxlsx::writeData(wb,x = gambling_lvl_type0,   startCol = 8, startRow = 5,   sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_type1,   startCol = 8, startRow = 12,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_lvl_type2,   startCol = 8, startRow = 19,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)

openxlsx::writeData(wb,x = gambling_pct_type0,   startCol = 9, startRow = 5,   sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_type1,   startCol = 9, startRow = 12,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)
openxlsx::writeData(wb,x = gambling_pct_type2,   startCol = 9, startRow = 19,  sheet = "TAB2_main_results", rowNames = FALSE, colNames = FALSE)

##### WRITE OUT RESULTS

saveWorkbook(wb,paste0("output/results_tables.xlsx"), overwrite = T)
