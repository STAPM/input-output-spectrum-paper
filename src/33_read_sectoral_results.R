

policy_1_alcohol  <- readRDS("intermediate/policy_1_alcohol.rds")
policy_2_tobacco  <- readRDS("intermediate/policy_2_tobacco.rds")
policy_3_food     <- readRDS("intermediate/policy_3_food.rds")
policy_4_gambling <- readRDS("intermediate/policy_4_gambling.rds")


################################################################
### get vectors of results to write to the spreadsheet

mapping <- cdohio.mod::cpa_to_sector

mapping[sector_broad == "Finance, real estate, professional and administrative services", sector_broad := sector]

### alcohol

sec_effects     <- policy_1_alcohol$type2_effects_by_product[, -c("earn_vec")]

sec_effects <- merge(mapping, sec_effects, by = c("CPA"), sort = F)

sec_effects_alc <- sec_effects[, .(alcohol = sum(gva_vec)), by = "sector_broad"]

### tobacco

sec_effects     <- policy_2_tobacco$type2_effects_by_product[, -c("earn_vec")]

sec_effects <- merge(mapping, sec_effects, by = c("CPA"), sort = F)

sec_effects_tob <- sec_effects[, .(tobacco = sum(gva_vec)), by = "sector_broad"]

### food

sec_effects     <- policy_3_food$type2_effects_by_product[, -c("earn_vec")]

sec_effects <- merge(mapping, sec_effects, by = c("CPA"), sort = F)

sec_effects_food <- sec_effects[, .(food = sum(gva_vec)), by = "sector_broad"]

### gambling

sec_effects     <- policy_4_gambling$type2_effects_by_product[, -c("earn_vec")]

sec_effects <- merge(mapping, sec_effects, by = c("CPA"), sort = F)

sec_effects_gambling <- sec_effects[, .(gambling = sum(gva_vec)), by = "sector_broad"]

#############################
#### Merge together #########

sector_results <- merge(sec_effects_alc, sec_effects_tob, by = c("sector_broad"), sort = F)
sector_results <- merge(sector_results, sec_effects_food, by = c("sector_broad"), sort = F)
sector_results <- merge(sector_results, sec_effects_gambling, by = c("sector_broad"), sort = F)

sector_totals <- sector_results[, .(alcohol = sum(alcohol),
                                    tobacco = sum(tobacco),
                                    food = sum(food),
                                    gambling = sum(gambling))]

sector_results_final <- rbindlist(list(sector_results, sector_totals), fill = TRUE, use.names = TRUE)

rm(mapping, sec_effects, sec_effects_alc, sec_effects_tob, sec_effects_food, sec_effects_gambling, sector_results, sector_totals)

