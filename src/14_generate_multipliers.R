source("src/03_load_packages.R")

multipliers <- Multipliers(year_io = 2019)

category <- c(rep("Other",7),
              rep("Food",7),
              "Other",
              "Alcohol & Tobacco",
              rep("Other",51),
              "Alcohol & Tobacco",
              rep("Other",31),
              "Gambling",
              rep("Other",5))

multipliers[, type  := category]
multipliers[, type2 := ifelse(type == "Other","Other","CDOH")]
multipliers[type2 == "CDOH", text  := Product]

multipliers[Product == "Preserved meat and meat products", text := "Meat"]
multipliers[Product == "Processed and preserved fish, crustaceans, molluscs, fruit and vegetables", text := "Fish, \nfruit & veg"]
multipliers[Product == "Vegetable and animal oils and fats", text := "Oils & \nfats"]
multipliers[Product == "Dairy products", text := "Dairy"]
multipliers[Product == "Grain mill products, starches and starch products", text := "Grains & \nstarches"]
multipliers[Product == "Bakery and farinaceous products", text := "Bakery"]
multipliers[Product == "Other food products", text := "Other \nfood"]
multipliers[Product == "Alcoholic beverages  & Tobacco products", text := "Off-Trade\nAlcohol & \ntobacco"]
multipliers[Product == "Gambling and betting services", text := "Gambling"]
multipliers[Product == "Food and beverage serving services", text := "On-Trade\nAlcohol"]



##########################################################################
#### ------------------- OUTPUT MULTIPLIERS ------------------------- ####
##########################################################################

#######################################
### Plot type 2 output multipliers

multipliers[text == "Meat",                output_multipliers_t2_lab := output_multipliers_t2 + 0.5]
multipliers[text == "Fish, \nfruit & veg", output_multipliers_t2_lab := output_multipliers_t2 + 0.5]
multipliers[text == "Oils & \nfats",       output_multipliers_t2_lab := output_multipliers_t2 + 0.5]
multipliers[text == "Dairy",               output_multipliers_t2_lab := output_multipliers_t2 - 2.0]
multipliers[text == "Grains & \nstarches", output_multipliers_t2_lab := output_multipliers_t2 - 2.1]
multipliers[text == "Bakery",              output_multipliers_t2_lab := output_multipliers_t2 + 0.2]
multipliers[text == "Other \nfood",        output_multipliers_t2_lab := output_multipliers_t2 - 2.6]
multipliers[text == "Off-Trade\nAlcohol & \ntobacco", output_multipliers_t2_lab := output_multipliers_t2 + 0.6]
multipliers[text == "Gambling",            output_multipliers_t2_lab := output_multipliers_t2 + 0.3]
multipliers[text == "On-Trade\nAlcohol",   output_multipliers_t2_lab := output_multipliers_t2 + 0.6]

multipliers[text == "Meat",                 hjust_lab := "center"]
multipliers[text == "Fish, \nfruit & veg",  hjust_lab := "outward"]
multipliers[text == "Oils & \nfats",        hjust_lab := "inward"]
multipliers[text == "Dairy",                hjust_lab := "center"]
multipliers[text == "Grains & \nstarches",  hjust_lab := "center"]
multipliers[text == "Bakery",               hjust_lab := "center"]
multipliers[text == "Other \nfood",         hjust_lab := "center"]
multipliers[text == "Off-Trade\nAlcohol & \ntobacco"  ,hjust_lab := "center"]
multipliers[text == "Gambling",             hjust_lab := "outward"]
multipliers[text == "On-Trade\nAlcohol",    hjust_lab := "center"]

ggplot(multipliers) +
  aes(x = reorder(Product, -output_multipliers_t2), y = output_multipliers_t2, fill = type, alpha = type2) +
  geom_col(position = "dodge") +
  geom_text(aes(x = reorder(Product, -output_multipliers_t2), y = output_multipliers_t2_lab, label = text, hjust = hjust_lab)) +
  geom_hline(yintercept = 0, color = "black") +
  theme_minimal() +
  scale_x_discrete(labels = NULL) +
  scale_fill_manual(values = c("#fb8500","#c1121f","#5e548e","#003566")) +
  scale_alpha_manual(values = c(1,0.2)) +
  scale_color_manual(values = c("white","black")) +
  scale_y_continuous(breaks = seq(0,16,2)) +
  labs(x = "Product category (ordered by multiplier value)",
       y = "Output Multiplier",
       fill = "") +
  theme(legend.position = "none")  +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank())
ggsave("output/output_multipliers_type2.svg", width = 8, height = 6)

##########################################################################
#### ---------------------- GVA MULTIPLIERS ------------------------- ####
##########################################################################

#######################################
### Plot type 2 GVA multipliers

multipliers[text == "Meat",                gva_multipliers_t2_lab := gva_multipliers_t2 + 0.2]
multipliers[text == "Fish, \nfruit & veg", gva_multipliers_t2_lab := gva_multipliers_t2 - 1.1]
multipliers[text == "Oils & \nfats",       gva_multipliers_t2_lab := gva_multipliers_t2 + 0.5]
multipliers[text == "Dairy",               gva_multipliers_t2_lab := gva_multipliers_t2 - 0.7]
multipliers[text == "Grains & \nstarches", gva_multipliers_t2_lab := gva_multipliers_t2 - 0.7]
multipliers[text == "Bakery",              gva_multipliers_t2_lab := gva_multipliers_t2 + 0.1]
multipliers[text == "Other \nfood",        gva_multipliers_t2_lab := gva_multipliers_t2 - 1.1]
multipliers[text == "Off-Trade\nAlcohol & \ntobacco", gva_multipliers_t2_lab := gva_multipliers_t2 + 0.4]
multipliers[text == "Gambling",            gva_multipliers_t2_lab := gva_multipliers_t2 + 0.15]
multipliers[text == "On-Trade\nAlcohol",   gva_multipliers_t2_lab := gva_multipliers_t2 + 0.05]

multipliers[text == "Meat",                 hjust_lab := "center"]
multipliers[text == "Fish, \nfruit & veg",  hjust_lab := "outward"]
multipliers[text == "Oils & \nfats",        hjust_lab := "inward"]
multipliers[text == "Dairy",                hjust_lab := "outward"]
multipliers[text == "Grains & \nstarches",  hjust_lab := "inward"]
multipliers[text == "Bakery",               hjust_lab := "outward"]
multipliers[text == "Other \nfood",         hjust_lab := "inward"]
multipliers[text == "Off-Trade\nAlcohol & \ntobacco"  ,hjust_lab := "inward"]
multipliers[text == "Gambling",             hjust_lab := "inward"]
multipliers[text == "On-Trade\nAlcohol",    hjust_lab := "inward"]

ggplot(multipliers) +
  aes(x = reorder(Product, -gva_multipliers_t2), y = gva_multipliers_t2, fill = type, alpha = type2) +
  geom_col(position = "dodge") +
  geom_text(aes(x = reorder(Product, -gva_multipliers_t2), y = gva_multipliers_t2_lab, label = text, hjust = hjust_lab)) +
  geom_hline(yintercept = 0, color = "black") +
  theme_minimal() +
  scale_x_discrete(labels = NULL) +
  scale_fill_manual(values = c("#fb8500","#c1121f","#5e548e","#003566")) +
  scale_alpha_manual(values = c(1,0.2)) +
  scale_color_manual(values = c("white","black")) +
  scale_y_continuous(breaks = seq(0,7,1)) +
  labs(x = "Product category (ordered by multiplier value)",
       y = "Gross Value Added Multiplier",
       fill = "") +
  theme(legend.position = "none")  +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank())
ggsave("output/gva_multipliers_type2.svg", width = 8, height = 6)

##############################################################################
#### Tax simulation

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

  mean_hourly_wage <- mean(distributions$hourly_distribution)
  mean_annual_wage <- mean(distributions$annual_distribution)

  ### Calculate the total change in income tax receipts:
  ### a) at the mean
  ### b) for the observed individual wages

  distributions[, mean_annual := 31576]

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
       x = "Tax change at mean as % of observed tax change") +
  scale_x_continuous(breaks = seq(0.6,0.9,0.05), labels = scales::percent)
ggsave("output/tax_simulation.svg", width = 8, height = 6)
