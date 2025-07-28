
### This code calculates baseline economic impacts of the four consumption categories

######################
### prepare inputs ###

## fixed inputs
year <- 2019
year_io <- 2019
reallocate_prop <- 0
reallocate_food <- NULL
consumption_category <- NULL

## scenario-varying inputs (list objects with one vector of expenditure changes per scenario)
change_food            <- list(rep(-0.0, 19), rep(-0.0, 19), c(rep(-0.0, 18), 1), rep(-0.0, 19))
change_gambling        <- list(rep(-0.0, 9),  rep(-0.0, 9),  rep(-0.0, 9),  rep(1, 9))
change_tobacco_licit   <- list(rep(-0.0, 2),  rep(1, 2),  rep(-0.0, 2),  rep(-0.0, 2))
change_tobacco_illicit <- list(rep(-0.0, 2),  rep(0, 2),  rep(-0.0, 2),  rep(-0.0, 2))
change_alcohol_off     <- list(rep(1, 4),  rep(-0.0, 4),  rep(-0.0, 4),  rep(-0.0, 4))
change_alcohol_on      <- list(rep(1, 4),  rep(-0.0, 4),  rep(-0.0, 4),  rep(-0.0, 4))

excluded_products <- NULL

label      <- c("alcohol","tobacco","food","gambling")

##############
### launch ###

## loop over the four scenarios

for (i in 1:4){

baseline <- cdohio(year = year,
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
                   consumption_category = consumption_category)

  assign(paste0("baseline_",i,"_",label[i]), baseline)
  rm(baseline)

}

################################################################
### save out the results

saveRDS(baseline_1_alcohol,  "intermediate/baseline_1_alcohol.rds")
saveRDS(baseline_2_tobacco,  "intermediate/baseline_2_tobacco.rds")
saveRDS(baseline_3_food,     "intermediate/baseline_3_food.rds")
saveRDS(baseline_4_gambling, "intermediate/baseline_4_gambling.rds")

