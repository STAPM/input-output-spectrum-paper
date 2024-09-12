
## This code runs the four scenarios while varying the input-output table used

# (i)   alcohol (-10% all alcohol)
# (ii)  tobacco (-10% all tobacco, licit and illicit)
# (iii) food (-10% confectionary)
# (iv)  gambling (-10% gross gambling yield)

######################
### prepare inputs ###

## fixed inputs
year <- 2019
year_io_vec <- 2017:2020
reallocate_prop <- 1.0
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

## loop over the four scenarios and reallocation proportions

for (i in 1:4){
  for (j in 1:length(year_io_vec)){

    policy <- cdohio(year = year,
                     year_io = year_io_vec[j],
                     reallocate_prop = reallocate_prop,
                     excluded_products = excluded_products[i],
                     change_food = change_food[[i]],
                     change_gambling = change_gambling[[i]],
                     change_tobacco_licit = change_tobacco_licit[[i]],
                     change_tobacco_illicit = change_tobacco_illicit[[i]],
                     change_alcohol = change_alcohol[[i]],
                     reallocate_food = reallocate_food[[i]],
                     consumption_category = consumption_category)

    effects <- policy$effects

    ## remove gross earnings and keep only the full effect
    effects[, earn_vec := NULL]
    effects <- effects[type == "Direct + Indirect + Induced", ]

    effects <- melt(effects,
                    id.vars = "type",
                    value.name = "estimate",
                    variable.name = "outcome")

    effects[, type := NULL]

    effects[, policy := excluded_products[i]]
    effects[, year_io_table := year_io_vec[j]]



    if (i == 1 & j == 1){
      sa2_result <- copy(effects)
    } else {
      sa2_result <- rbindlist(list(sa2_result, effects))
    }

  }
}

##############################################
#### Plot the sensitivity analysis results

sa2_result[, outcome := factor(outcome,
                               levels = c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec"),
                               labels = c("Output","Gross Value Added","Tax on Employers","Employment","Net Earnings","Tax on Employees"))]

sa2_result[, policy := factor(policy,
                              levels = c("alcohol","tobacco","food","gambling"),
                              labels = c("(1) alcohol", "(2) tobacco", "(3) food", "(4) gambling"))]

#############################################
## Calculate all effects relative to 2019

sa2_result_2019 <- sa2_result[year_io_table == 2019]
setnames(sa2_result_2019, c("estimate"), c("estimate_2019"))
sa2_result_2019[, year_io_table := NULL]

sa2_result <- merge(sa2_result, sa2_result_2019, by = c("outcome","policy"), sort = FALSE)
sa2_result[, estimate_rel := (estimate/estimate_2019) - 1]

ggplot(sa2_result) +
  aes(x = year_io_table, y = estimate_rel, fill = policy) +
  facet_wrap(~outcome, ncol = 2) +
  geom_col(position = "dodge", colour = "black") +
  geom_hline(yintercept = 0, colour = "black", linewidth = 1, linetype = 2) +
  theme_minimal() +
  #theme_classic() +
  labs(y = "Absolute Direct + Indirect + Induced Effect \n(% relative to 2019)",
       x = "Input-Output Table",
       fill = "scenario")  +
  scale_y_continuous(labels = scales::percent) +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank()) +
  scale_fill_manual(values = c("#fb8b24","#e36414","#9a031e","#5f0f40"))
ggsave("output/FIG3_SA_io_table.jpg", width = 8, height = 6)
ggsave("output/FIG3_SA_io_table.pdf", width = 8, height = 6)
