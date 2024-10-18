### simulate a lognormal wage distribution

library(data.table)
library(ggplot2)

set.seed(42)

### Assume there is an increase in employment in an industry with a wage
### distribution that is lognormally distributed with parameters:
###
### meanlog = 2.4 (mean of £31,576)
### sdlog = 0.8
###
### This change in employment is equally spread across the distribution
### of the sector

n_sim <- 1000
tax_ratio <- rep(NA, n_sim)

for (i in 1:n_sim){

hourly_distribution <- rlnorm(1000, meanlog = 2.4, sdlog = 0.8)

annual_distribution <- hourly_distribution * 40 * 52

summary(hourly_distribution)
summary(annual_distribution)

distributions <- data.table(hourly_distribution = hourly_distribution,
                            annual_distribution = annual_distribution)

ggplot(distributions) +
  aes(x = annual_distribution) +
  geom_density()

ggplot(distributions) +
  aes(x = hourly_distribution) +
  geom_density()


mean_hourly_wage <- mean(distributions$hourly_distribution)
mean_annual_wage <- mean(distributions$annual_distribution)

### Calculate the total change in income tax receipts:
### a) at the mean
### b) for the observed individual wages

distributions[, mean_annual := 31576]

#########################################################################
###### CALCULATE THE TAXES PAID AT THE MEAN AND AT OBSERVED VALUES

### assume a simple tax schedule:
### - 0% up to 10000
### - 20% from 10,001 to 40,000
### - 40% from 40,001

####### (a) tax at the mean
distributions[, upper := mean_annual - 40000]
distributions[, lower := mean_annual - 10000]

distributions[, upper := ifelse(upper < 0, 0, upper)]
distributions[, lower := ifelse(lower < 0, 0, lower)]
distributions[, lower := ifelse(lower > 30000, 30000, lower)]

distributions[, tax_at_mean := (0.2 * lower) + (0.4 * upper)]

distributions[, c("upper","lower") := NULL]

####### (b) tax at the observed values
distributions[, upper := annual_distribution - 40000]
distributions[, lower := annual_distribution - 10000]

distributions[, upper := ifelse(upper < 0, 0, upper)]
distributions[, lower := ifelse(lower < 0, 0, lower)]
distributions[, lower := ifelse(lower > 30000, 30000, lower)]

distributions[, tax_at_observed := (0.2 * lower) + (0.4 * upper)]

distributions[, c("upper","lower") := NULL]

####### (c) tax at the observed values (non_random - new employment is all
######      in lower paid work on average than the mean within the sector)

distributions[, hourly_distribution2 := rlnorm(1000, meanlog = 1.4, sdlog = 0.4)]
distributions[, annual_distribution2 := hourly_distribution2 * 40 * 52]

distributions[, upper := annual_distribution2 - 40000]
distributions[, lower := annual_distribution2 - 10000]

distributions[, upper := ifelse(upper < 0, 0, upper)]
distributions[, lower := ifelse(lower < 0, 0, lower)]
distributions[, lower := ifelse(lower > 30000, 30000, lower)]

distributions[, tax_at_observed2 := (0.2 * lower) + (0.4 * upper)]

distributions[, c("upper","lower") := NULL]

###### Compare outcomes at mean with observed


tax_ratio[i]  <- sum(distributions$tax_at_mean) / sum(distributions$tax_at_observed)

}

tax_ratio_data <- data.table(ratio = tax_ratio)

ggplot(tax_ratio_data) +
  aes(x = ratio) +
  geom_density(fill = "blue", alpha = 0.3) +
  theme_minimal() +
  labs(y = "Density",
       x = "Tax change at mean as % of osberved tax change") +
  scale_x_continuous(breaks = seq(0.6,0.9,0.05), labels = scales::percent)
