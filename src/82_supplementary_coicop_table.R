source("src/03_load_packages.R")



code <- readxl::read_excel("data/supublicationtablesbb23v2.xlsx",
                           sheet = "Table 3 - HHFCe 2019",
                           range = "C3:AL3", col_names = FALSE)


name <- readxl::read_excel("data/supublicationtablesbb23v2.xlsx",
                           sheet = "Table 3 - HHFCe 2019",
                           range = "C4:AL4", col_names = FALSE)

code <- matrix(code, nrow = 1)
code <- unlist(code)

name <- matrix(name, nrow = 1)
name <- unlist(name)

coicop_tab <- data.table(code, name)
setnames(coicop_tab, c("code","name"), c("Code","Description"))

print(coicop_tab)
