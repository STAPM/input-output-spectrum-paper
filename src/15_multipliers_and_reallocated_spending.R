
### this script file calculates how much of reallocated spending is shifted to products
### with i) higher output multipliers, ii) higher GVA multipliers, and iii) a higher
### ratio of output in basic prices to supply in purchaser prices.

#################################
### read in the supply table

supply <- cdohio.mod::inputoutput_2019$supply

supply_to_output <- supply$supply_to_output

#################################
### read in final demand vectors:


demand_alcohol  <- readRDS("intermediate/final_demand_1_alcohol.rds")[,"final_demand"]
demand_tobacco  <- readRDS("intermediate/final_demand_2_tobacco.rds")[,"final_demand"]
demand_food     <- readRDS("intermediate/final_demand_3_food.rds")[,"final_demand"]
demand_gambling <- readRDS("intermediate/final_demand_4_gambling.rds")[,"final_demand"]

#################################
### read in the multipliers

multipliers <- Multipliers(year_io = 2019)

multipliers <- data.table(multipliers,
                          demand_alcohol = demand_alcohol,
                          demand_tobacco = demand_tobacco,
                          demand_food = demand_food,
                          demand_gambling = demand_gambling,
                          supply_to_output = supply_to_output)

####################################################
## scale the changing demand vector to sum to 1

multipliers[Product == "Alcoholic beverages  & Tobacco products", demand_alcohol.final_demand := 0]
multipliers[Product == "Alcoholic beverages  & Tobacco products", demand_tobacco.final_demand := 0]
multipliers[Product == "Other food products", demand_food.final_demand := 0]
multipliers[Product == "Gambling and betting services", demand_gambling.final_demand := 0]

multipliers[, alcohol  := demand_alcohol.final_demand / sum(demand_alcohol.final_demand)]
multipliers[, tobacco  := demand_tobacco.final_demand / sum(demand_tobacco.final_demand)]
multipliers[, food     := demand_food.final_demand / sum(demand_food.final_demand)]
multipliers[, gambling := demand_gambling.final_demand / sum(demand_gambling.final_demand)]

multipliers[, c("demand_alcohol.final_demand","demand_tobacco.final_demand",
                "demand_food.final_demand","demand_gambling.final_demand") := NULL]


############### calculate where spending is going in each scenario relative to GVA of the core product

multiplier_gva2_alc_tob <-  as.numeric(multipliers[Product == "Alcoholic beverages  & Tobacco products", "gva_multipliers_t2"])
multiplier_gva2_food <-     as.numeric(multipliers[Product == "Other food products", "gva_multipliers_t2"])
multiplier_gva2_gambling <- as.numeric(multipliers[Product == "Gambling and betting services", "gva_multipliers_t2"])

multiplier_out2_alc_tob <-  as.numeric(multipliers[Product == "Alcoholic beverages  & Tobacco products", "output_multipliers_t2"])
multiplier_out2_food <-     as.numeric(multipliers[Product == "Other food products", "output_multipliers_t2"])
multiplier_out2_gambling <- as.numeric(multipliers[Product == "Gambling and betting services", "output_multipliers_t2"])

ratio_supply_alc_tob <-  as.numeric(multipliers[Product == "Alcoholic beverages  & Tobacco products", "supply_to_output"])
ratio_supply_food <-     as.numeric(multipliers[Product == "Other food products", "supply_to_output"])
ratio_supply_gambling <- as.numeric(multipliers[Product == "Gambling and betting services", "supply_to_output"])



#### Proportion of reallocated spending which is on products with a higher multiplier

reallocate_output_multipliers <- matrix(c(
sum(multipliers[output_multipliers_t2 >= multiplier_out2_alc_tob, "alcohol"]),
sum(multipliers[output_multipliers_t2 >= multiplier_out2_alc_tob, "tobacco"]),
sum(multipliers[output_multipliers_t2 >= multiplier_out2_food, "food"]),
sum(multipliers[output_multipliers_t2 >= multiplier_out2_gambling, "gambling"])
),
nrow = 1)

reallocate_gva_multipliers <- matrix(c(
sum(multipliers[gva_multipliers_t2 >= multiplier_gva2_alc_tob, "alcohol"]),
sum(multipliers[gva_multipliers_t2 >= multiplier_gva2_alc_tob, "tobacco"]),
sum(multipliers[gva_multipliers_t2 >= multiplier_gva2_food, "food"]),
sum(multipliers[gva_multipliers_t2 >= multiplier_gva2_gambling, "gambling"])
),
nrow = 1)

reallocate_supply_ratio <- matrix(c(
sum(multipliers[supply_to_output >= ratio_supply_alc_tob, "alcohol"]),
sum(multipliers[supply_to_output >= ratio_supply_alc_tob, "tobacco"]),
sum(multipliers[supply_to_output >= ratio_supply_food, "food"]),
sum(multipliers[supply_to_output >= ratio_supply_gambling, "gambling"])
),
nrow = 1)


rm(multiplier_gva2_alc_tob, multiplier_gva2_food, multiplier_gva2_gambling,
   multiplier_out2_alc_tob, multiplier_out2_food, multiplier_out2_gambling,
   ratio_supply_alc_tob, ratio_supply_food, ratio_supply_gambling, multipliers, supply, supply_to_output,
   demand_alcohol, demand_tobacco, demand_food, demand_gambling)
