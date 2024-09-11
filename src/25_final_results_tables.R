
### This code writes out results to the output tables spreadsheet template

wb <- openxlsx::loadWorkbook("output/templates/output_tables_template.xlsx")

openxlsx::writeData(wb,x = alcohol_inputs,   startCol = 2, startRow = 5,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = tobacco_l_inputs, startCol = 3, startRow = 6,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = tobacco_i_inputs, startCol = 3, startRow = 7,  sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = food_inputs,      startCol = 4, startRow = 14, sheet = "TAB1_scenario_inputs")
openxlsx::writeData(wb,x = gambling_inputs,  startCol = 5, startRow = 15, sheet = "TAB1_scenario_inputs")

saveWorkbook(wb,paste0("output/results_tables.xlsx"), overwrite = T)
