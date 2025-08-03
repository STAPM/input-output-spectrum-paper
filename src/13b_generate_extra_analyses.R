source("src/03_load_packages.R")

## This code runs the three extra scenarios - dividing alcohol into on/off trade
## and adding endogenous government spending changes to the tobacco scenario (
## taken from the increase in tax revenues estimated from scenario 2)

# (1a) alcohol (-10% on-trade alcohol)
# (1b) alcohol (-10% off-trade alcohol)
# (2a) tobacco (-10% all tobacco, licit and illicit, + change in govt spending)

######################
### prepare inputs ###

## fixed inputs
year <- 2019
year_io <- 2019
reallocate_prop <- 1.00
reallocate_food <- NULL
consumption_category <- NULL
govt_allocation <- 2

## scenario-varying inputs (list objects with one vector of expenditure changes per scenario)
change_food            <- list(rep(-0.0, 19), rep(-0.0, 19), rep(-0.0, 19))
change_gambling        <- list(rep(-0.0, 9),  rep(-0.0, 9),  rep(-0.0, 9))
change_tobacco_licit   <- list(rep(-0.0, 2),  rep(-0.0, 2),  rep(-0.1, 2))
change_tobacco_illicit <- list(rep(-0.0, 2),  rep(-0.0, 2),  rep(-0.1, 2))
change_alcohol_on      <- list(rep(-0.1, 4),  rep(-0.0, 4),  rep(-0.0, 4))
change_alcohol_off     <- list(rep(-0.0, 4),  rep(-0.1, 4),  rep(-0.0, 4))

excluded_products      <- c("alcohol","alcohol","tobacco")

govt_spend             <- c(0, 0, 1175+203)

##############
### launch ###

## loop over the three scenarios

for (i in 1:3){

policy <- cdohio(year = year,
                 year_io = year_io,
                 reallocate_prop = reallocate_prop,
                 excluded_products = excluded_products[[i]],
                 change_food = change_food[[i]],
                 change_gambling = change_gambling[[i]],
                 change_tobacco_licit = change_tobacco_licit[[i]],
                 change_tobacco_illicit = change_tobacco_illicit[[i]],
                 change_alcohol_on = change_alcohol_on[[i]],
                 change_alcohol_off = change_alcohol_off[[i]],
                 reallocate_food = reallocate_food[[i]],
                 consumption_category = consumption_category,
                 govt_spend = govt_spend[i],
                 govt_allocation = govt_allocation)

assign(paste0("policy_",i), policy)
rm(policy)

}

################################################################
### save out the final demand vector

saveRDS(policy_1$final_demand, "intermediate/final_demand_1a_alcohol_on.rds")
saveRDS(policy_2$final_demand, "intermediate/final_demand_1b_alcohol_off.rds")
saveRDS(policy_3$final_demand, "intermediate/final_demand_2a_tobacco_plus_govt.rds")

################################################################
### save out the results

saveRDS(policy_1, "intermediate/policy_1a_alcohol_on.rds")
saveRDS(policy_2, "intermediate/policy_1b_alcohol_off.rds")
saveRDS(policy_3, "intermediate/policy_2a_tobacco_plus_govt.rds")

