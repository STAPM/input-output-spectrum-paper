source("src/03_load_packages.R")


policy_1a_alcohol_on   <- readRDS("intermediate/policy_1a_alcohol_on.rds")
policy_1b_alcohol_off  <- readRDS("intermediate/policy_1b_alcohol_off.rds")
policy_2a_tobacco_plus_govt  <- readRDS("intermediate/policy_2a_tobacco_plus_govt.rds")

################################################################
### get vectors of results to write to the spreadsheet (version 2)

### alcohol on-trade

effects     <- policy_1a_alcohol_on$effects[, -c("earn_vec")]
effects_pct <- policy_1a_alcohol_on$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

alcohol_on_lvl_output       <- as.matrix(effects$output_vec)
alcohol_on_lvl_gva          <- as.matrix(effects$gva_vec)
alcohol_on_lvl_tax          <- as.matrix(effects$tax_vec)
alcohol_on_lvl_fte          <- as.matrix(effects$fte_vec)
alcohol_on_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
alcohol_on_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

alcohol_on_pct_output       <- as.matrix(effects_pct$output_vec)
alcohol_on_pct_gva          <- as.matrix(effects_pct$gva_vec)
alcohol_on_pct_tax          <- as.matrix(effects_pct$tax_vec)
alcohol_on_pct_fte          <- as.matrix(effects_pct$fte_vec)
alcohol_on_pct_net_earn     <- as.matrix(effects_pct$net_earn_vec)
alcohol_on_pct_inc_tax_nics <- as.matrix(effects_pct$inc_tax_nics_vec)

### alcohol off-trade

effects     <- policy_1b_alcohol_off$effects[, -c("earn_vec")]
effects_pct <- policy_1b_alcohol_off$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

alcohol_off_lvl_output       <- as.matrix(effects$output_vec)
alcohol_off_lvl_gva          <- as.matrix(effects$gva_vec)
alcohol_off_lvl_tax          <- as.matrix(effects$tax_vec)
alcohol_off_lvl_fte          <- as.matrix(effects$fte_vec)
alcohol_off_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
alcohol_off_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

alcohol_off_pct_output       <- as.matrix(effects_pct$output_vec)
alcohol_off_pct_gva          <- as.matrix(effects_pct$gva_vec)
alcohol_off_pct_tax          <- as.matrix(effects_pct$tax_vec)
alcohol_off_pct_fte          <- as.matrix(effects_pct$fte_vec)
alcohol_off_pct_net_earn     <- as.matrix(effects_pct$net_earn_vec)
alcohol_off_pct_inc_tax_nics <- as.matrix(effects_pct$inc_tax_nics_vec)

### tobacco plus govt spending

effects     <- policy_2a_tobacco_plus_govt$effects[, -c("earn_vec")]
effects_pct <- policy_2a_tobacco_plus_govt$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

tobacco_plus_govt_lvl_output       <- as.matrix(effects$output_vec)
tobacco_plus_govt_lvl_gva          <- as.matrix(effects$gva_vec)
tobacco_plus_govt_lvl_tax          <- as.matrix(effects$tax_vec)
tobacco_plus_govt_lvl_fte          <- as.matrix(effects$fte_vec)
tobacco_plus_govt_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
tobacco_plus_govt_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

tobacco_plus_govt_pct_output       <- as.matrix(effects_pct$output_vec)
tobacco_plus_govt_pct_gva          <- as.matrix(effects_pct$gva_vec)
tobacco_plus_govt_pct_tax          <- as.matrix(effects_pct$tax_vec)
tobacco_plus_govt_pct_fte          <- as.matrix(effects_pct$fte_vec)
tobacco_plus_govt_pct_net_earn     <- as.matrix(effects_pct$net_earn_vec)
tobacco_plus_govt_pct_inc_tax_nics <- as.matrix(effects_pct$inc_tax_nics_vec)


rm(policy_1a_alcohol_on, policy_1b_alcohol_off, policy_2a_tobacco_plus_govt, effects, effects_pct)







