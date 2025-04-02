
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
### save out the results

saveRDS(policy_1_alcohol,  "intermediate/policy_1_alcohol.rds")
saveRDS(policy_2_tobacco,  "intermediate/policy_2_tobacco.rds")
saveRDS(policy_3_food,     "intermediate/policy_3_food.rds")
saveRDS(policy_4_gambling, "intermediate/policy_4_gambling.rds")

