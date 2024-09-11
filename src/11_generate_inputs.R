
### This code generate the inputs to the model

scenario_1 <- GenExpenditure(year = 2019,
                             change_food =            c(rep(0, 18),-0.1),
                             change_gambling =        rep(-0.1, 9),
                             change_tobacco_licit =   rep(-0.1, 2),
                             change_tobacco_illicit = rep(-0.1, 2),
                             change_alcohol =         rep(-0.1, 4))

## extract inputs to go into the summary table

alcohol_inputs   <- round(scenario_1$alcohol[1])
tobacco_l_inputs <- round(scenario_1$tobacco[1])
tobacco_i_inputs <- round(scenario_1$tobacco[3])
food_inputs      <- round(scenario_1$food[7])
gambling_inputs  <- round(scenario_1$gambling)


