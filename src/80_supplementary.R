source("src/03_load_packages.R")

### figures
source("src/81_supplementary_figures.R")

### tables
source("src/82_supplementary_coicop_table.R")


### fill in the workbook

wb <- openxlsx::loadWorkbook("output/templates/supplementary_tables_template_AUGUST25.xlsx")

#################################
### TABLE 1 - BASELINE

openxlsx::writeData(wb,x = coicop_tab,         startCol = 1, startRow = 3,  sheet = "TAB_coicop")

##### WRITE OUT RESULTS

saveWorkbook(wb,paste0("output/supplementary_tables.xlsx"), overwrite = T)
