

policy_1_alcohol  <- readRDS("intermediate/policy_1_alcohol.rds")
policy_2_tobacco  <- readRDS("intermediate/policy_2_tobacco.rds")
policy_3_food     <- readRDS("intermediate/policy_3_food.rds")
policy_4_gambling <- readRDS("intermediate/policy_4_gambling.rds")


################################################################
### get vectors of results to write to the spreadsheet


### alcohol

effects     <- policy_1_alcohol$effects[, -c("earn_vec")]
effects_pct <- policy_1_alcohol$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

alcohol_lvl_type0 <- t(as.matrix( effects[type == "Direct",                      c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
alcohol_lvl_type1 <- t(as.matrix( effects[type == "Direct + Indirect",           c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
alcohol_lvl_type2 <- t(as.matrix( effects[type == "Direct + Indirect + Induced", c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))

alcohol_pct_type0 <- t(as.matrix( effects_pct[type == "Direct",                      c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
alcohol_pct_type1 <- t(as.matrix( effects_pct[type == "Direct + Indirect",           c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
alcohol_pct_type2 <- t(as.matrix( effects_pct[type == "Direct + Indirect + Induced", c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))

### tobacco

effects     <- policy_2_tobacco$effects[, -c("earn_vec")]
effects_pct <- policy_2_tobacco$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

tobacco_lvl_type0 <- t(as.matrix( effects[type == "Direct",                      c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
tobacco_lvl_type1 <- t(as.matrix( effects[type == "Direct + Indirect",           c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
tobacco_lvl_type2 <- t(as.matrix( effects[type == "Direct + Indirect + Induced", c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))

tobacco_pct_type0 <- t(as.matrix( effects_pct[type == "Direct",                      c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
tobacco_pct_type1 <- t(as.matrix( effects_pct[type == "Direct + Indirect",           c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
tobacco_pct_type2 <- t(as.matrix( effects_pct[type == "Direct + Indirect + Induced", c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))

### food

effects     <- policy_3_food$effects[, -c("earn_vec")]
effects_pct <- policy_3_food$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

food_lvl_type0 <- t(as.matrix( effects[type == "Direct",                      c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
food_lvl_type1 <- t(as.matrix( effects[type == "Direct + Indirect",           c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
food_lvl_type2 <- t(as.matrix( effects[type == "Direct + Indirect + Induced", c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))

food_pct_type0 <- t(as.matrix( effects_pct[type == "Direct",                      c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
food_pct_type1 <- t(as.matrix( effects_pct[type == "Direct + Indirect",           c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
food_pct_type2 <- t(as.matrix( effects_pct[type == "Direct + Indirect + Induced", c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))

### gambling

effects     <- policy_4_gambling$effects[, -c("earn_vec")]
effects_pct <- policy_4_gambling$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

gambling_lvl_type0 <- t(as.matrix( effects[type == "Direct",                      c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
gambling_lvl_type1 <- t(as.matrix( effects[type == "Direct + Indirect",           c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
gambling_lvl_type2 <- t(as.matrix( effects[type == "Direct + Indirect + Induced", c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))

gambling_pct_type0 <- t(as.matrix( effects_pct[type == "Direct",                      c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
gambling_pct_type1 <- t(as.matrix( effects_pct[type == "Direct + Indirect",           c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))
gambling_pct_type2 <- t(as.matrix( effects_pct[type == "Direct + Indirect + Induced", c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec")] ))



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

alcohol_lvl_output       <- as.matrix(effects$output_vec)
alcohol_lvl_gva          <- as.matrix(effects$gva_vec)
alcohol_lvl_tax          <- as.matrix(effects$tax_vec)
alcohol_lvl_fte          <- as.matrix(effects$fte_vec)
alcohol_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
alcohol_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

alcohol_pct_output       <- as.matrix(effects_pct$output_vec)
alcohol_pct_gva          <- as.matrix(effects_pct$gva_vec)
alcohol_pct_tax          <- as.matrix(effects_pct$tax_vec)
alcohol_pct_fte          <- as.matrix(effects_pct$fte_vec)
alcohol_pct_net_earn     <- as.matrix(effects_pct$net_earn_vec)
alcohol_pct_inc_tax_nics <- as.matrix(effects_pct$inc_tax_nics_vec)

### tobacco

effects     <- policy_2_tobacco$effects[, -c("earn_vec")]
effects_pct <- policy_2_tobacco$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]

tobacco_lvl_output       <- as.matrix(effects$output_vec)
tobacco_lvl_gva          <- as.matrix(effects$gva_vec)
tobacco_lvl_tax          <- as.matrix(effects$tax_vec)
tobacco_lvl_fte          <- as.matrix(effects$fte_vec)
tobacco_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
tobacco_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

tobacco_pct_output       <- as.matrix(effects_pct$output_vec)
tobacco_pct_gva          <- as.matrix(effects_pct$gva_vec)
tobacco_pct_tax          <- as.matrix(effects_pct$tax_vec)
tobacco_pct_fte          <- as.matrix(effects_pct$fte_vec)
tobacco_pct_net_earn     <- as.matrix(effects_pct$net_earn_vec)
tobacco_pct_inc_tax_nics <- as.matrix(effects_pct$inc_tax_nics_vec)
### food

effects     <- policy_3_food$effects[, -c("earn_vec")]
effects_pct <- policy_3_food$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]


food_lvl_output       <- as.matrix(effects$output_vec)
food_lvl_gva          <- as.matrix(effects$gva_vec)
food_lvl_tax          <- as.matrix(effects$tax_vec)
food_lvl_fte          <- as.matrix(effects$fte_vec)
food_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
food_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

food_pct_output       <- as.matrix(effects_pct$output_vec)
food_pct_gva          <- as.matrix(effects_pct$gva_vec)
food_pct_tax          <- as.matrix(effects_pct$tax_vec)
food_pct_fte          <- as.matrix(effects_pct$fte_vec)
food_pct_net_earn     <- as.matrix(effects_pct$net_earn_vec)
food_pct_inc_tax_nics <- as.matrix(effects_pct$inc_tax_nics_vec)

### gambling

effects     <- policy_4_gambling$effects[, -c("earn_vec")]
effects_pct <- policy_4_gambling$effects_pct[, -c("earn_vec")]

effects_pct[, output_vec := output_vec/100]
effects_pct[, gva_vec := gva_vec/100]
effects_pct[, tax_vec := tax_vec/100]
effects_pct[, fte_vec := fte_vec/100]
effects_pct[, net_earn_vec := net_earn_vec/100]
effects_pct[, inc_tax_nics_vec := inc_tax_nics_vec/100]


gambling_lvl_output       <- as.matrix(effects$output_vec)
gambling_lvl_gva          <- as.matrix(effects$gva_vec)
gambling_lvl_tax          <- as.matrix(effects$tax_vec)
gambling_lvl_fte          <- as.matrix(effects$fte_vec)
gambling_lvl_net_earn     <- as.matrix(effects$net_earn_vec)
gambling_lvl_inc_tax_nics <- as.matrix(effects$inc_tax_nics_vec)

gambling_pct_output       <- as.matrix(effects_pct$output_vec)
gambling_pct_gva          <- as.matrix(effects_pct$gva_vec)
gambling_pct_tax          <- as.matrix(effects_pct$tax_vec)
gambling_pct_fte          <- as.matrix(effects_pct$fte_vec)
gambling_pct_net_earn     <- as.matrix(effects_pct$net_earn_vec)
gambling_pct_inc_tax_nics <- as.matrix(effects_pct$inc_tax_nics_vec)

rm(policy_1_alcohol, policy_2_tobacco, policy_3_food, policy_4_gambling, effects, effects_pct)







