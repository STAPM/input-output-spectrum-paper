
## This code runs the four scenarios

# (i)   alcohol (-10% all alcohol)
# (ii)  tobacco (-10% all tobacco, licit and illicit)
# (iii) food (-10% confectionary)
# (iv)  gambling (-10% gross gambling yield)

######################
### prepare inputs ###

## fixed inputs
year <- 2019
year_io <- 2019
reallocate_prop <- 1.00
reallocate_food <- NULL
consumption_category <- NULL

## scenario-varying inputs (list objects with one vector of expenditure changes per scenario)
change_food            <- list(rep(-0.0, 19), rep(-0.0, 19), c(rep(-0.0, 18),-0.1), rep(-0.0, 19))
change_gambling        <- list(rep(-0.0, 9),  rep(-0.0, 9),  rep(-0.0, 9),  rep(-0.1, 9))
change_tobacco_licit   <- list(rep(-0.0, 2),  rep(-0.1, 2),  rep(-0.0, 2),  rep(-0.0, 2))
change_tobacco_illicit <- list(rep(-0.0, 2),  rep(-0.1, 2),  rep(-0.0, 2),  rep(-0.0, 2))
change_alcohol         <- list(rep(-0.1, 4),  rep(-0.0, 4),  rep(-0.0, 4),  rep(-0.0, 4))

excluded_products      <- c("alcohol","tobacco","food","gambling")


##############
### launch ###

## loop over the four scenarios

for (i in 1:4){

policy <- cdohio(year = year,
                 year_io = year_io,
                 reallocate_prop = reallocate_prop,
                 excluded_products = excluded_products[[i]],
                 change_food = change_food[[i]],
                 change_gambling = change_gambling[[i]],
                 change_tobacco_licit = change_tobacco_licit[[i]],
                 change_tobacco_illicit = change_tobacco_illicit[[i]],
                 change_alcohol = change_alcohol[[i]],
                 reallocate_food = reallocate_food[[i]],
                 consumption_category = consumption_category)

assign(paste0("policy_",i,"_",excluded_products[i]), policy)
rm(policy)

}

################################################################
### save out the final demand vector

saveRDS(policy_1_alcohol$final_demand,  "intermediate/final_demand_1_alcohol.rds")
saveRDS(policy_2_tobacco$final_demand,  "intermediate/final_demand_2_tobacco.rds")
saveRDS(policy_3_food$final_demand,     "intermediate/final_demand_3_food.rds")
saveRDS(policy_4_gambling$final_demand, "intermediate/final_demand_4_gambling.rds")

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



rm(policy_1_alcohol, policy_2_tobacco, policy_3_food, policy_4_gambling, effects, effects_pct)
