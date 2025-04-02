
baseline_1_alcohol  <- readRDS("intermediate/baseline_1_alcohol.rds")
baseline_2_tobacco  <- readRDS("intermediate/baseline_2_tobacco.rds")
baseline_3_food     <- readRDS("intermediate/baseline_3_food.rds")
baseline_4_gambling <- readRDS("intermediate/baseline_4_gambling.rds")

################################################################
### get vectors of results to write to the spreadsheet (version 2)

baseline <- baseline_1_alcohol$baseline

### alcohol

effects     <- baseline_1_alcohol$effects[, -c("earn_vec")]
effects_pct <- baseline_1_alcohol$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

alcohol_base_lvl_output       <- as.matrix(effects$output_vec)
alcohol_base_lvl_gva          <- as.matrix(effects$gva_vec)
alcohol_base_lvl_tax          <- as.matrix(effects$tax_vec)
alcohol_base_lvl_fte          <- as.matrix(effects$fte_vec)
alcohol_base_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
alcohol_base_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

### tobacco

effects     <- baseline_2_tobacco$effects[, -c("earn_vec")]
effects_pct <- baseline_2_tobacco$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

tobacco_base_lvl_output       <- as.matrix(effects$output_vec)
tobacco_base_lvl_gva          <- as.matrix(effects$gva_vec)
tobacco_base_lvl_tax          <- as.matrix(effects$tax_vec)
tobacco_base_lvl_fte          <- as.matrix(effects$fte_vec)
tobacco_base_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
tobacco_base_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

### food

effects     <- baseline_3_food$effects[, -c("earn_vec")]
effects_pct <- baseline_3_food$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]


food_base_lvl_output       <- as.matrix(effects$output_vec)
food_base_lvl_gva          <- as.matrix(effects$gva_vec)
food_base_lvl_tax          <- as.matrix(effects$tax_vec)
food_base_lvl_fte          <- as.matrix(effects$fte_vec)
food_base_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
food_base_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

### gambling

effects     <- baseline_4_gambling$effects[, -c("earn_vec")]
effects_pct <- baseline_4_gambling$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]


gambling_base_lvl_output       <- as.matrix(effects$output_vec)
gambling_base_lvl_gva          <- as.matrix(effects$gva_vec)
gambling_base_lvl_tax          <- as.matrix(effects$tax_vec)
gambling_base_lvl_fte          <- as.matrix(effects$fte_vec)
gambling_base_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
gambling_base_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

## unhealthy commodities as % of baseline

perc_base_output       <- (alcohol_base_lvl_output[1] + tobacco_base_lvl_output[1] + food_base_lvl_output[1] + gambling_base_lvl_output[1]) / (baseline[1])
perc_base_gva          <- (alcohol_base_lvl_gva[1] + tobacco_base_lvl_gva[1] + food_base_lvl_gva[1] + gambling_base_lvl_gva[1]) / (baseline[2])
perc_base_tax          <- (alcohol_base_lvl_tax[1] + tobacco_base_lvl_tax[1] + food_base_lvl_tax[1] + gambling_base_lvl_tax[1]) / (baseline[3])
perc_base_fte          <- (alcohol_base_lvl_fte[1] + tobacco_base_lvl_fte[1] + food_base_lvl_fte[1] + gambling_base_lvl_fte[1]) / (baseline[4])
perc_base_net_earn     <- (alcohol_base_lvl_net_earn[1] + tobacco_base_lvl_net_earn[1] + food_base_lvl_net_earn[1] + gambling_base_lvl_net_earn[1]) / (baseline[5])
perc_base_inc_tax_nics <- (alcohol_base_lvl_inc_tax_nics[1] + tobacco_base_lvl_inc_tax_nics[1] + food_base_lvl_inc_tax_nics[1] + gambling_base_lvl_inc_tax_nics[1]) / (baseline[6])

rm(baseline_1_alcohol, baseline_2_tobacco, baseline_3_food, baseline_4_gambling, effects, effects_pct)


