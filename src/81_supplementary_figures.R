source("src/03_load_packages.R")

#############################################################################
### Plot time series of mean prices for cigarettes from different sources ###


plot_data <- read.csv("data/Tobacco_Price_Cigarettes_20pk.csv") %>% setDT
plot_data[, X := NULL]

cig_price_data <- melt(plot_data, id.vars = "year", value.name = "price", variable.name = "source")

cig_price_data[, source := factor(source,
                                  levels = c("price_cigs_20pk_1","price_cigs_20pk_2","price_cigs_20pk_3","price_cigs_20pk_4","price_cigs_20pk_5"),
                                  labels = c("ONS RPI Cigarettes\nking size filter",
                                             "Morris et al. (2024)",
                                             "EU Commission (WAP)",
                                             "World Health Organisation",
                                             "STAPM TAX-sim v2.5.0"))]


ggplot(cig_price_data) +
  aes(x = year, y = price, color = source, linewidth = source, linetype = source) +
  geom_line() +
  geom_point(size = 1.5)+
  scale_x_continuous(breaks = seq(2008,2024,2), minor_breaks = NULL) +
  scale_y_continuous(breaks = seq(0,14,2), labels = scales::dollar_format(prefix = "£")) +
  scale_colour_manual(values = c("#081c15","#6a994e","#a7c957","#3a86ff","#e36414")) +
  scale_linewidth_manual(values = c(1,1,1,1,1.25)) +
  scale_linetype_manual(values = c(2,2,2,2,1)) +
  labs(y = "Price per 20 cigarettes",
       x = "",
       colour = "Data source",
       linetype = "Data source",
       linewidth = "Data source") +
  theme_minimal() +
  expand_limits(y = 0)
ggsave("output/FIG_SUPP_cigarette_prices.svg", width = 8, height = 6)

########################################################
### time series of gambling expenditures

data <- cdohio.mod::gambling_expenditure

data[, gambling_category2 := NA ]
data[, gambling_category2 := ifelse(gambling_category %in% c("Arcades (non-remote)"), "Arcades", gambling_category2)]
data[, gambling_category2 := ifelse(gambling_category %in% c("Betting (non-remote)", "Betting (remote)"), "Betting", gambling_category2)]
data[, gambling_category2 := ifelse(gambling_category %in% c("Bingo (non-remote)", "Bingo (remote)"), "Bingo", gambling_category2)]
data[, gambling_category2 := ifelse(gambling_category %in% c("Casino (non-remote)", "Casino (remote)"), "Casino", gambling_category2)]
data[, gambling_category2 := ifelse(gambling_category %in% c("Lotteries (remote and non-remote)"), "Lotteries", gambling_category2)]
data[, gambling_category2 := ifelse(gambling_category %in% c("The National Lottery (remote and non-remote)"), "The National Lottery", gambling_category2)]


data[, gambling_category := as.character(gambling_category)]
data[gambling_category == "The National Lottery (remote and non-remote)", gambling_category := "The National Lottery"]
data[gambling_category == "Lotteries (remote and non-remote)", gambling_category := "Lotteries"]


ggplot(data) +
  aes(x = year, y = ggy_mn/1000, color = gambling_category) +
  facet_wrap(~gambling_category2, ncol = 2) +
  geom_line(linewidth = 1.0) +
  theme_minimal() +
  scale_y_continuous(labels = scales::dollar_format(prefix = "£")) +
  scale_x_continuous(breaks = c(2008,2015,2022), minor_breaks = NULL) +
  scale_color_manual(values = c("#ee9b00",
                                "#3a5a40","#003566","#5a189a",
                                "#90a955","#0096c7","#9d4edd",
                                "#8c2f39","#d00000")) +
  labs(y = "Gross Gambling Yield (£billions)",
       x = "",
       color = "Gambling Category") +
  theme(axis.text.x = element_text(size = 6))
ggsave("output/FIG_SUPP_gambling_ggy.svg", width = 8, height = 6)

