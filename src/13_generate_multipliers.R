
multipliers <- Multipliers(year_io = 2019)

category <- c(rep("Other",7),
              rep("Food",7),
              "Other",
              "Alcohol & Tobacco",
              rep("Other",83),
              "Gambling",
              rep("Other",5))

multipliers[, type := category]


ggplot(multipliers) +
  aes(x = reorder(Product, output_multipliers_t2), y = output_multipliers_t2, fill = type) +
  geom_col(position = "dodge") +
  geom_hline(yintercept = 1, colour = "black") +
  scale_x_discrete(labels = NULL) +
  theme_classic() +
  scale_fill_manual(values = c("#ffb3c6","#f4a261","#a7c957","#003566")) +
  labs(x = "Product (ordered by multiplier value)",
       y = "Output Multiplier",
       fill = "")

ggplot(multipliers) +
  aes(x = reorder(Product, gva_multipliers_t2), y = gva_multipliers_t2, fill = type) +
  geom_col(position = "dodge") +
  scale_x_discrete(labels = NULL) +
  scale_y_continuous(breaks = 1:7) +
  theme_minimal() +
  scale_fill_manual(values = c("#ffb3c6","#f4a261","#a7c957","#003566")) +
  labs(x = "Product (ordered by multiplier value)",
       y = "GVA Multiplier",
       fill = "")  +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank())

multipliers <- multipliers[order(-gva_multipliers_t2),]
multipliers[, rank_multiplier := 1:105]
