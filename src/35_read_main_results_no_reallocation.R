source("src/03_load_packages.R")


policy_1_alcohol  <- readRDS("intermediate/policy_1_alcohol_no_reallocation.rds")
policy_2_tobacco  <- readRDS("intermediate/policy_2_tobacco_no_reallocation.rds")
policy_3_food     <- readRDS("intermediate/policy_3_food_no_reallocation.rds")
policy_4_gambling <- readRDS("intermediate/policy_4_gambling_no_reallocation.rds")

################################################################
### get vectors of results to write to the spreadsheet (version 2)

### alcohol

effects     <- policy_1_alcohol$effects[, -c("earn_vec")]
effects_pct <- policy_1_alcohol$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

alcohol_lvl_output_no_r       <- as.matrix(effects$output_vec)
alcohol_lvl_gva_no_r          <- as.matrix(effects$gva_vec)
alcohol_lvl_tax_no_r          <- as.matrix(effects$tax_vec)
alcohol_lvl_fte_no_r          <- as.matrix(effects$fte_vec)
alcohol_lvl_net_earn_no_r     <- as.matrix(effects$net_earn_vec)
alcohol_lvl_inc_tax_nics_no_r <- as.matrix(effects$inc_tax_nics_vec)

alcohol_pct_output_no_r       <- as.matrix(effects_pct$output_vec)
alcohol_pct_gva_no_r          <- as.matrix(effects_pct$gva_vec)
alcohol_pct_tax_no_r          <- as.matrix(effects_pct$tax_vec)
alcohol_pct_fte_no_r          <- as.matrix(effects_pct$fte_vec)
alcohol_pct_net_earn_no_r     <- as.matrix(effects_pct$net_earn_vec)
alcohol_pct_inc_tax_nics_no_r <- as.matrix(effects_pct$inc_tax_nics_vec)

### tobacco

effects     <- policy_2_tobacco$effects[, -c("earn_vec")]
effects_pct <- policy_2_tobacco$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

tobacco_lvl_output_no_r       <- as.matrix(effects$output_vec)
tobacco_lvl_gva_no_r          <- as.matrix(effects$gva_vec)
tobacco_lvl_tax_no_r          <- as.matrix(effects$tax_vec)
tobacco_lvl_fte_no_r          <- as.matrix(effects$fte_vec)
tobacco_lvl_net_earn_no_r     <- as.matrix(effects$net_earn_vec)
tobacco_lvl_inc_tax_nics_no_r <- as.matrix(effects$inc_tax_nics_vec)

tobacco_pct_output_no_r       <- as.matrix(effects_pct$output_vec)
tobacco_pct_gva_no_r          <- as.matrix(effects_pct$gva_vec)
tobacco_pct_tax_no_r          <- as.matrix(effects_pct$tax_vec)
tobacco_pct_fte_no_r          <- as.matrix(effects_pct$fte_vec)
tobacco_pct_net_earn_no_r     <- as.matrix(effects_pct$net_earn_vec)
tobacco_pct_inc_tax_nics_no_r <- as.matrix(effects_pct$inc_tax_nics_vec)

### food

effects     <- policy_3_food$effects[, -c("earn_vec")]
effects_pct <- policy_3_food$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]


food_lvl_output_no_r       <- as.matrix(effects$output_vec)
food_lvl_gva_no_r          <- as.matrix(effects$gva_vec)
food_lvl_tax_no_r          <- as.matrix(effects$tax_vec)
food_lvl_fte_no_r          <- as.matrix(effects$fte_vec)
food_lvl_net_earn_no_r     <- as.matrix(effects$net_earn_vec)
food_lvl_inc_tax_nics_no_r <- as.matrix(effects$inc_tax_nics_vec)

food_pct_output_no_r       <- as.matrix(effects_pct$output_vec)
food_pct_gva_no_r          <- as.matrix(effects_pct$gva_vec)
food_pct_tax_no_r          <- as.matrix(effects_pct$tax_vec)
food_pct_fte_no_r          <- as.matrix(effects_pct$fte_vec)
food_pct_net_earn_no_r     <- as.matrix(effects_pct$net_earn_vec)
food_pct_inc_tax_nics_no_r <- as.matrix(effects_pct$inc_tax_nics_vec)

### gambling

effects     <- policy_4_gambling$effects[, -c("earn_vec")]
effects_pct <- policy_4_gambling$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]


gambling_lvl_output_no_r       <- as.matrix(effects$output_vec)
gambling_lvl_gva_no_r          <- as.matrix(effects$gva_vec)
gambling_lvl_tax_no_r          <- as.matrix(effects$tax_vec)
gambling_lvl_fte_no_r          <- as.matrix(effects$fte_vec)
gambling_lvl_net_earn_no_r     <- as.matrix(effects$net_earn_vec)
gambling_lvl_inc_tax_nics_no_r <- as.matrix(effects$inc_tax_nics_vec)

gambling_pct_output_no_r       <- as.matrix(effects_pct$output_vec)
gambling_pct_gva_no_r          <- as.matrix(effects_pct$gva_vec)
gambling_pct_tax_no_r          <- as.matrix(effects_pct$tax_vec)
gambling_pct_fte_no_r          <- as.matrix(effects_pct$fte_vec)
gambling_pct_net_earn_no_r     <- as.matrix(effects_pct$net_earn_vec)
gambling_pct_inc_tax_nics_no_r <- as.matrix(effects_pct$inc_tax_nics_vec)

rm(policy_1_alcohol, policy_2_tobacco, policy_3_food, policy_4_gambling, effects, effects_pct)
