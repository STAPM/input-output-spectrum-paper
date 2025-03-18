
## This code runs the four scenarios while varying the reallocation percentage

# (i)   alcohol (-10% all alcohol)
# (ii)  tobacco (-10% all tobacco, licit and illicit)
# (iii) food (-10% confectionary)
# (iv)  gambling (-10% gross gambling yield)

######################
### prepare inputs ###

## fixed inputs
year <- 2019
year_io <- 2019
reallocate_prop_vec <- seq(0,1,0.05)
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
  for (j in 1:length(reallocate_prop_vec)){

  policy <- cdohio(year = year,
                   year_io = year_io,
                   reallocate_prop = reallocate_prop_vec[j],
                   excluded_products = excluded_products[i],
                   change_food = change_food[[i]],
                   change_gambling = change_gambling[[i]],
                   change_tobacco_licit = change_tobacco_licit[[i]],
                   change_tobacco_illicit = change_tobacco_illicit[[i]],
                   change_alcohol = change_alcohol[[i]],
                   reallocate_food = reallocate_food[[i]],
                   consumption_category = consumption_category)

  effects_pct <- policy$effects_pct

  ## remove gross earnings and keep only the full effect
  effects_pct[, earn_vec := NULL]
  effects_pct <- effects_pct[type == "Direct + Indirect + Induced", ]

  effects_pct <- melt(effects_pct,
                      id.vars = "type",
                      value.name = "pct",
                      variable.name = "outcome")

  effects_pct[, type := NULL]

  effects_pct[, policy := excluded_products[i]]
  effects_pct[, reallocation_rate := reallocate_prop_vec[j]]



  if (i == 1 & j == 1){
  sa2_result <- copy(effects_pct)
  } else {
  sa2_result <- rbindlist(list(sa2_result, effects_pct))
  }

  }
}

## should be 264 rows (4 scenarios * 11 reallocation rates * 6 outcomes)

##############################################
#### Plot the sensitivity analysis results

sa2_result[, outcome := factor(outcome,
                               levels = c("output_vec","gva_vec","tax_vec","fte_vec","net_earn_vec","inc_tax_nics_vec"),
                               labels = c("Output","Gross Value Added","Tax on Employers","Employment","Net Earnings","Tax on Employees"))]

sa2_result[, policy := factor(policy,
                              levels = c("alcohol","tobacco","food","gambling"),
                              labels = c("Alcohol", "Tobacco", "Confectionary", "Gambling"))]

sa2_result[, prop := pct/100]

ggplot(sa2_result) +
  aes(x = reallocation_rate, y = prop, color = policy) +
  facet_wrap(~outcome, ncol = 2, scales = "free_y") +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 0, color = "black", linewidth = 1, linetype = 2) +
  theme_minimal() +
  labs(y = "Direct + Indirect + Induced Effect (%)",
       x = "Proportion of Expenditure Reallocated",
       colour = "scenario") +
  scale_y_continuous(labels = scales::percent) +
  scale_colour_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA2_reallocation_rate.jpg", width = 8, height = 6)
ggsave("output/FIG_SA2_reallocation_rate.pdf", width = 8, height = 6)





################################################################
## zoom in on each plot to identify the "break-even" point

ggplot(sa2_result[outcome == "Output"]) +
  aes(x = reallocation_rate, y = pct, color = policy) +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 0, color = "black", linewidth = 1, linetype = 2) +
  scale_x_continuous(breaks = seq(0,1,0.2)) +
  theme_minimal() +
  labs(y = "Direct + Indirect + Induced Effect (%)",
       x = "Proportion of Expenditure Reallocated") +
  ylim(NA,0.1) +
  geom_point(data = data.table(y = rep(0,4), x = c(0.12,0.05,0.33,0.29)),
             aes(x = x, y = y), colour = "black", size = 3) +
  scale_colour_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA2b_reallocation_rate_Output.jpg", width = 8, height = 6)
ggsave("output/FIG_SA2b_reallocation_rate_Output.pdf", width = 8, height = 6)

ggplot(sa2_result[outcome == "Gross Value Added"]) +
  aes(x = reallocation_rate, y = pct, color = policy) +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 0, color = "black", linewidth = 1, linetype = 2) +
  scale_x_continuous(breaks = seq(0,1,0.2)) +
  theme_minimal() +
  labs(y = "Direct + Indirect + Induced Effect (%)",
       x = "Proportion of Expenditure Reallocated") +
  ylim(NA,0.1) +
  geom_point(data = data.table(y = rep(0,4), x = c(0.09,0.04,0.25,0.31)),
             aes(x = x, y = y), colour = "black", size = 3) +
  scale_colour_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA2b_reallocation_rate_GVA.jpg", width = 8, height = 6)
ggsave("output/FIG_SA2b_reallocation_rate_GVA.pdf", width = 8, height = 6)

ggplot(sa2_result[outcome == "Tax on Employers"]) +
  aes(x = reallocation_rate, y = pct, color = policy) +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 0, color = "black", linewidth = 1, linetype = 2) +
  scale_x_continuous(breaks = seq(0,1,0.2)) +
  theme_minimal() +
  labs(y = "Direct + Indirect + Induced Effect (%)",
       x = "Proportion of Expenditure Reallocated") +
  ylim(-0.25,0.25) +
  geom_point(data = data.table(y = rep(0,4), x = c(0.36,0.50,0.27,0.41)),
             aes(x = x, y = y), colour = "black", size = 3) +
  scale_colour_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA2b_reallocation_rate_TaxEmployers.jpg", width = 8, height = 6)
ggsave("output/FIG_SA2b_reallocation_rate_TaxEmployers.pdf", width = 8, height = 6)

ggplot(sa2_result[outcome == "Employment"]) +
  aes(x = reallocation_rate, y = pct, color = policy) +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 0, color = "black", linewidth = 1, linetype = 2) +
  scale_x_continuous(breaks = seq(0,1,0.2)) +
  theme_minimal() +
  labs(y = "Direct + Indirect + Induced Effect (%)",
       x = "Proportion of Expenditure Reallocated") +
  ylim(-0.01,0.02) +
  geom_point(data = data.table(y = rep(0,4), x = c(0.075,0.03,0.21,0.25)),
             aes(x = x, y = y), colour = "black", size = 3) +
  scale_colour_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA2b_reallocation_rate_Employment.jpg", width = 8, height = 6)
ggsave("output/FIG_SA2b_reallocation_rate_Employment.pdf", width = 8, height = 6)


ggplot(sa2_result[outcome == "Net Earnings"]) +
  aes(x = reallocation_rate, y = pct, color = policy) +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 0, color = "black", linewidth = 1, linetype = 2) +
  scale_x_continuous(breaks = seq(0,1,0.2)) +
  theme_minimal() +
  labs(y = "Direct + Indirect + Induced Effect (%)",
       x = "Proportion of Expenditure Reallocated") +
  ylim(-0.01,0.01) +
  geom_point(data = data.table(y = rep(0,4), x = c(0.08,0.03,0.21,0.25)),
             aes(x = x, y = y), colour = "black", size = 3) +
  scale_colour_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA2b_reallocation_rate_NetEarnings.jpg", width = 8, height = 6)
ggsave("output/FIG_SA2b_reallocation_rate_NetEarnings.pdf", width = 8, height = 6)

ggplot(sa2_result[outcome == "Tax on Employees"]) +
  aes(x = reallocation_rate, y = pct, color = policy) +
  geom_line(linewidth = 1) +
  geom_hline(yintercept = 0, color = "black", linewidth = 1, linetype = 2) +
  scale_x_continuous(breaks = seq(0,1,0.2)) +
  theme_minimal() +
  labs(y = "Direct + Indirect + Induced Effect (%)",
       x = "Proportion of Expenditure Reallocated") +
  ylim(-0.01,0.01) +
  geom_point(data = data.table(y = rep(0,4), x = c(0.085,0.035,0.20,0.24)),
             aes(x = x, y = y), colour = "black", size = 3) +
  scale_colour_manual(values = c("#00b4d8","#bc6c25","#c1121f","#5e548e"))
ggsave("output/FIG_SA2b_reallocation_rate_IncTaxes.jpg", width = 8, height = 6)
ggsave("output/FIG_SA2b_reallocation_rate_IncTaxes.pdf", width = 8, height = 6)

#########################################################
### bar plot of the interpolated break-even points

sa2_result_bar <- unique(sa2_result[,c("outcome","policy")])
sa2_result_bar <- sa2_result_bar[order(outcome,policy),]

break_even <- c(0.12,0.05,0.33,0.29,
                0.09,0.04,0.25,0.31,
                0.36,0.50,0.27,0.41,
                0.075,0.03,0.21,0.25,
                0.08,0.03,0.21,0.25,
                0.085,0.035,0.20,0.24)

sa2_result_bar[, break_even_point := break_even]

##################

sa2_result_bar_new <- copy(sa2_result_bar)
sa2_result_bar_new[, add := 1 - break_even_point]

sa2_result_bar_new <- melt(sa2_result_bar_new,
                           id.vars = c("outcome","policy"))

sa2_result_bar_new[, variable := factor(variable,
                                        levels = rev(c("break_even_point","add")))]

sa2_result_bar_new[, label := paste0(value*100,"%")]
sa2_result_bar_new[variable == "add", label := NA]


ggplot(sa2_result_bar_new) +
  aes(x = policy, y = value, fill = variable) +
  geom_col(colour = "black") +
  geom_text(aes(label = label), vjust = -0.5, size = 4) +
  facet_wrap(~outcome, ncol = 2) +
  labs(y = "'Break-even' Reallocation Rate",
       x = "Scenario",
       fill = "scenario") +
  scale_y_continuous(labels = scales::percent) +
  scale_fill_manual(values = c("white","#5e548e")) +
  theme_minimal() +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank(),
          # remove legend
    legend.position = "none")
ggsave("output/FIG_SA2_break_evens.jpg", width = 8, height = 6)
ggsave("output/FIG_SA2_break_evens.pdf", width = 8, height = 6)
