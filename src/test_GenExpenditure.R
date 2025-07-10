GenExpenditure <- function(year = 2019,
                           change_food =            rep(0,19),
                           change_gambling =        rep(0,9),
                           change_tobacco_licit =   rep(0,2),
                           change_tobacco_illicit = rep(0,2),
                           change_alcohol =         rep(0,4),
                           reallocate_food = NULL){

  y <- copy(year)

  ###################################
  #### Changes in food expenditure

  food_data <- cdohio.mod::food_expenditure[year == y,]

  food_data[, pct_change := change_food]

  food_data[, exp_change := ((1 + pct_change) * exp_food_mn) - exp_food_mn]

  food_data <- food_data[, .(exp_change = sum(exp_change)), by = "cpa"]

  food_vec <- c(as.numeric(food_data[cpa == "meat"              ,"exp_change"]),
                as.numeric(food_data[cpa == "fish_fruit_and_veg","exp_change"]),
                as.numeric(food_data[cpa == "oils_and_fats"     ,"exp_change"]),
                as.numeric(food_data[cpa == "dairy"             ,"exp_change"]),
                as.numeric(food_data[cpa == "grains_and_starch" ,"exp_change"]),
                as.numeric(food_data[cpa == "bakery"            ,"exp_change"]),
                as.numeric(food_data[cpa == "other_food"        ,"exp_change"]))

  names(food_vec) <- c("meat","fish_fruit_and_veg","oils_and_fats","dairy",
                       "grains_and_starch","bakery","other_food")

  ## reallocate change in spending on food to the selected category

  if (!is.null(reallocate_food)){

    j <- reallocate_food

    food_exp_all_reallocate <- -1*sum(food_vec)

    food_vec[j] <- food_vec[j] + food_exp_all_reallocate

  }

  #########################################
  #### Changes in gambling expenditure

  gambling_data <- cdohio.mod::gambling_expenditure[year == y,]

  gambling_data[, pct_change := change_gambling]

  gambling_data[, exp_change := ((1 + pct_change) * ggy_mn) - ggy_mn]

  gambling_data <- gambling_data[, .(exp_change = sum(exp_change))]

  gambling_vec <- as.numeric(gambling_data[,"exp_change"])

  names(gambling_vec) <- c("gambling")

  #########################################
  #### Changes in tobacco expenditure

  ## generate a figure for tobacco in basic prices as well as purchaser prices using
  ## the tax % of spending in the data and 14.26% as the import % from the 2021 supply
  ## table combined alcohol and tobacco category.
  ## Assumes tobacco import % = joint tobacco and alcohol import % and distributors trading
  ## margin for tobacco = 0

  tobacco_data <- cdohio.mod::tobacco_expenditure[year == y,]

  ## get percentage changes
  tobacco_data[tobacco_category == "cigarettes", pct_change_licit := change_tobacco_licit[1] ]
  tobacco_data[tobacco_category == "cigarettes", pct_change_illicit := change_tobacco_illicit[1] ]
  tobacco_data[tobacco_category == "hrt", pct_change_licit := change_tobacco_licit[2] ]
  tobacco_data[tobacco_category == "hrt", pct_change_illicit := change_tobacco_illicit[2] ]

  ## calculate expenditure changes
  tobacco_data[, exp_change_licit := ((1 + pct_change_licit) * spend_licit_mn) - spend_licit_mn]
  tobacco_data[, exp_change_licit_bp := exp_change_licit * (1 - tax_pct - 0.1426)]
  tobacco_data[, exp_change_illicit := ((1 + pct_change_illicit) * spend_illicit_mn) - spend_illicit_mn]

  ## calculate change in tax take
  tobacco_data[, tax := exp_change_licit * tax_pct]

  ## sum over all tobacco products
  tobacco_data <- tobacco_data[, .(exp_change_licit = sum(exp_change_licit),
                                   exp_change_licit_bp = sum(exp_change_licit_bp),
                                   exp_change_illicit = sum(exp_change_illicit),
                                   tax_change = sum(tax))]

  ## extract outputs
  tobacco_vec <- c(as.numeric(tobacco_data[,"exp_change_licit"]),
                   as.numeric(tobacco_data[,"exp_change_licit_bp"]),
                   as.numeric(tobacco_data[,"exp_change_illicit"]))

  tobacco_tax <- as.numeric(tobacco_data[,"tax_change"])

  names(tobacco_vec) <- c("tobacco_l","tobacco_l_bp","tobacco_i")

  #########################################
  #### Changes in alcohol expenditure

  ## generate a figure for alcohol in basic prices as well as purchaser prices using
  ## the tax % of spending in the data, 14.26% as the import % from the 2021 supply
  ## table combined alcohol and tobacco category, and 25.15% as the distributor trading margin.
  ## Assumes alcohol import % = joint tobacco and alcohol import % and distributors trading
  ## margin for alcohol = joint tobacco and alcohol

  alcohol_data <- cdohio.mod::alcohol_expenditure[year == y,]

  ## get percentage changes
  alcohol_data[alcohol_category == "beer",    pct_change := change_alcohol[1] ]
  alcohol_data[alcohol_category == "cider",   pct_change := change_alcohol[2] ]
  alcohol_data[alcohol_category == "wine",    pct_change := change_alcohol[3] ]
  alcohol_data[alcohol_category == "spirits", pct_change := change_alcohol[4] ]

  ## calculate expenditure changes
  alcohol_data[, exp_change_alcohol := ((1 + pct_change) * exp_alcohol_mn) - exp_alcohol_mn]
  alcohol_data[, exp_change_alcohol_bp := exp_change_alcohol * (1 - tax_pct - 0.1426 - 0.2515)]

  ## calculate tax changes
  alcohol_data[, tax := exp_change_alcohol * tax_pct]

  ## sum over all alcohol products

  alcohol_data <- alcohol_data[, .(exp_change_alcohol = sum(exp_change_alcohol),
                                   exp_change_alcohol_bp = sum(exp_change_alcohol_bp),
                                   tax_change = sum(tax) )]

  ## extract outputs
  alcohol_vec <- c(as.numeric(alcohol_data[,"exp_change_alcohol"]),
                   as.numeric(alcohol_data[,"exp_change_alcohol_bp"]))

  alcohol_tax <- as.numeric(alcohol_data[,"tax_change"])

  names(alcohol_vec) <- c("alcohol","alcohol_bp")

  ###################################
  #### Return vectors as a list

  return(list(food = food_vec,
              gambling = gambling_vec,
              tobacco = tobacco_vec,
              alcohol = alcohol_vec,
              tob_tax = tobacco_tax,
              alc_tax = alcohol_tax))

}
