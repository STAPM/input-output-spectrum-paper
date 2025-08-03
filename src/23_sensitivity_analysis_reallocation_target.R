source("src/03_load_packages.R")

## This code runs the four scenarios while varying the input-output table used

# (i)   alcohol (-10% all alcohol)
# (ii)  tobacco (-10% all tobacco, licit and illicit)
# (iii) food (-10% confectionary)
# (iv)  gambling (-10% gross gambling yield)

######################
### prepare inputs ###

## fixed inputs
year <- 2019
year_io <- 2019
reallocate_prop <- 1.0
reallocate_food <- NULL
consumption_category_vec <- 1:36

## scenario-varying inputs (list objects with one vector of expenditure changes per scenario)
change_food            <- list(rep(-0.0, 19), rep(-0.0, 19), c(rep(-0.0, 18),-0.1), rep(-0.0, 19))
change_gambling        <- list(rep(-0.0, 9),  rep(-0.0, 9),  rep(-0.0, 9),  rep(-0.1, 9))
change_tobacco_licit   <- list(rep(-0.0, 2),  rep(-0.1, 2),  rep(-0.0, 2),  rep(-0.0, 2))
change_tobacco_illicit <- list(rep(-0.0, 2),  rep(-0.1, 2),  rep(-0.0, 2),  rep(-0.0, 2))
change_alcohol_on      <- list(rep(-0.1, 4),  rep(-0.0, 4),  rep(-0.0, 4),  rep(-0.0, 4))
change_alcohol_off     <- list(rep(-0.1, 4),  rep(-0.0, 4),  rep(-0.0, 4),  rep(-0.0, 4))

excluded_products      <- c("alcohol","tobacco","food","gambling")


##############
### launch ###

## loop over the four scenarios and reallocation proportions

for (i in 1:4){
  for (j in 1:length(consumption_category_vec)){

    policy <- cdohio(year = year,
                     year_io = year_io,
                     reallocate_prop = reallocate_prop,
                     excluded_products = excluded_products[i],
                     change_food = change_food[[i]],
                     change_gambling = change_gambling[[i]],
                     change_tobacco_licit = change_tobacco_licit[[i]],
                     change_tobacco_illicit = change_tobacco_illicit[[i]],
                     change_alcohol_on = change_alcohol_on[[i]],
                     change_alcohol_off = change_alcohol_off[[i]],
                     reallocate_food = reallocate_food[[i]],
                     consumption_category = consumption_category_vec[j])

    effects_pct <- policy$effects_pct

    ## remove gross earnings and keep only the full effect
    effects_pct[, earn_vec := NULL]
    effects_pct <- effects_pct[type == "Direct + Indirect + Induced", ]

    effects_pct <- melt(effects_pct,
                        id.vars = "type",
                        value.name = "estimate_rel",
                        variable.name = "outcome")

    effects_pct[, type := NULL]

    effects_pct[, policy := excluded_products[i]]
    effects_pct[, consumption_category := consumption_category_vec[j]]



    if (j == 1){
      sa3_result <- copy(effects_pct)
    } else {
      sa3_result <- rbindlist(list(sa3_result, effects_pct))
    }

  }

  assign(paste0("sa3_result_",excluded_products[i]),sa3_result)
  rm(sa3_result)
}

sa3_result <- rbindlist(list(sa3_result_alcohol, sa3_result_tobacco, sa3_result_food, sa3_result_gambling))
rm(sa3_result_alcohol, sa3_result_tobacco, sa3_result_food, sa3_result_gambling)

##############################################
#### Plot the sensitivity analysis results

sa3_result[, outcome := factor(outcome,
                               levels = c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec"),
                               labels = c("Output","Gross Value Added","Tax on Employers","Employment","Net Earnings","Tax on Employees"))]

sa3_result[, policy := factor(policy,
                              levels = c("alcohol","tobacco","food","gambling"),
                              labels = c("(1) alcohol", "(2) tobacco", "(3) food", "(4) gambling"))]

#############################################
## Calculate all effects relative to 2019

ggplot(sa3_result[outcome == "Output"]) +
  aes(x = consumption_category, y = estimate_rel/100, fill = policy) +
  facet_wrap(~policy, ncol = 2, scales = "free_y") +
  geom_col(position = "dodge", colour = "black") +
  geom_hline(yintercept = 0, colour = "black", linewidth = 1, linetype = 2) +
  theme_minimal() +
  #theme_classic() +
  labs(y = "Direct + Indirect + Induced Effect",
       x = "Consumption category",
       fill = "scenario")  +
  scale_y_continuous(labels = scales::percent) +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  scale_fill_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA3_consumption_category_Output.svg", width = 8, height = 6)

ggplot(sa3_result[outcome == "Gross Value Added"]) +
  aes(x = consumption_category, y = estimate_rel/100, fill = policy) +
  facet_wrap(~policy, ncol = 2, scales = "free_y") +
  geom_col(position = "dodge", colour = "black") +
  geom_hline(yintercept = 0, colour = "black", linewidth = 1, linetype = 2) +
  theme_minimal() +
  #theme_classic() +
  labs(y = "Direct + Indirect + Induced Effect",
       x = "Consumption category",
       fill = "scenario")  +
  scale_y_continuous(labels = scales::percent) +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  scale_fill_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA3_consumption_category_GVA.svg", width = 8, height = 6)

ggplot(sa3_result[outcome == "Tax on Employers"]) +
  aes(x = consumption_category, y = estimate_rel/100, fill = policy) +
  facet_wrap(~policy, ncol = 2, scales = "free_y") +
  geom_col(position = "dodge", colour = "black") +
  geom_hline(yintercept = 0, colour = "black", linewidth = 1, linetype = 2) +
  theme_minimal() +
  #theme_classic() +
  labs(y = "Direct + Indirect + Induced Effect",
       x = "Consumption category",
       fill = "scenario")  +
  scale_y_continuous(labels = scales::percent) +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  scale_fill_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA3_consumption_category_TaxEmployers.svg", width = 8, height = 6)


ggplot(sa3_result[outcome == "Employment"]) +
  aes(x = consumption_category, y = estimate_rel/100, fill = policy) +
  facet_wrap(~policy, ncol = 2, scales = "free_y") +
  geom_col(position = "dodge", colour = "black") +
  geom_hline(yintercept = 0, colour = "black", linewidth = 1, linetype = 2) +
  theme_minimal() +
  #theme_classic() +
  labs(y = "Direct + Indirect + Induced Effect",
       x = "Consumption category",
       fill = "scenario")  +
  scale_y_continuous(labels = scales::percent) +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  scale_fill_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA3_consumption_category_Employment.svg", width = 8, height = 6)


ggplot(sa3_result[outcome == "Net Earnings"]) +
  aes(x = consumption_category, y = estimate_rel/100, fill = policy) +
  facet_wrap(~policy, ncol = 2, scales = "free_y") +
  geom_col(position = "dodge", colour = "black") +
  geom_hline(yintercept = 0, colour = "black", linewidth = 1, linetype = 2) +
  theme_minimal() +
  #theme_classic() +
  labs(y = "Direct + Indirect + Induced Effect",
       x = "Consumption category",
       fill = "scenario")  +
  scale_y_continuous(labels = scales::percent) +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  scale_fill_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA3_consumption_category_NetEarnings.svg", width = 8, height = 6)


ggplot(sa3_result[outcome == "Tax on Employees"]) +
  aes(x = consumption_category, y = estimate_rel/100, fill = policy) +
  facet_wrap(~policy, ncol = 2, scales = "free_y") +
  geom_col(position = "dodge", colour = "black") +
  geom_hline(yintercept = 0, colour = "black", linewidth = 1, linetype = 2) +
  theme_minimal() +
  #theme_classic() +
  labs(y = "Direct + Indirect + Induced Effect",
       x = "Consumption category",
       fill = "scenario")  +
  scale_y_continuous(labels = scales::percent) +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  scale_fill_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA3_consumption_category_IncTaxes.svg", width = 8, height = 6)


nrow(sa3_result[outcome == "Gross Value Added" & estimate_rel < 0 & policy == "(1) alcohol"])
nrow(sa3_result[outcome == "Gross Value Added" & estimate_rel < 0 & policy == "(2) tobacco"])
nrow(sa3_result[outcome == "Gross Value Added" & estimate_rel < 0 & policy == "(3) food"])
nrow(sa3_result[outcome == "Gross Value Added" & estimate_rel < 0 & policy == "(4) gambling"])



sa3_result_table <- sa3_result[outcome == "Gross Value Added"]

sa3_result_table[, outcome := NULL]
sa3_result_table[, consumption_category := factor(consumption_category,
                                                  levels = 1:36,
                                                  labels = cdohio.mod::coicop_categories$label)]

sa3_result_table <- dcast(sa3_result_table, consumption_category ~ policy, value.var = "estimate_rel")
