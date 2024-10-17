
multipliers <- Multipliers(year_io = 2019)

category <- c(rep("Other",7),
              rep("Food",7),
              "Other",
              "Alcohol & Tobacco",
              rep("Other",83),
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
multipliers[Product == "Alcoholic beverages  & Tobacco products", text := "Alcohol & \ntobacco"]
multipliers[Product == "Gambling and betting services", text := "Gambling"]

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
multipliers[text == "Alcohol & \ntobacco", output_multipliers_t2_lab := output_multipliers_t2 + 0.6]
multipliers[text == "Gambling",            output_multipliers_t2_lab := output_multipliers_t2 + 0.3]

multipliers[text == "Meat",                 hjust_lab := "center"]
multipliers[text == "Fish, \nfruit & veg",  hjust_lab := "outward"]
multipliers[text == "Oils & \nfats",        hjust_lab := "inward"]
multipliers[text == "Dairy",                hjust_lab := "center"]
multipliers[text == "Grains & \nstarches",  hjust_lab := "center"]
multipliers[text == "Bakery",               hjust_lab := "center"]
multipliers[text == "Other \nfood",         hjust_lab := "center"]
multipliers[text == "Alcohol & \ntobacco"  ,hjust_lab := "center"]
multipliers[text == "Gambling",             hjust_lab := "outward"]

ggplot(multipliers) +
  aes(x = reorder(Product, -output_multipliers_t2), y = output_multipliers_t2, fill = type, alpha = type2) +
  geom_col(position = "dodge") +
  geom_text(aes(x = reorder(Product, -output_multipliers_t2), y = output_multipliers_t2_lab, label = text, hjust = hjust_lab)) +
  geom_hline(yintercept = 0, color = "black") +
  theme_minimal() +
  scale_x_discrete(labels = NULL) +
  scale_fill_manual(values = c("#fb8500","#9a031e","#5f0f40","#003566")) +
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
ggsave("output/output_multipliers_type2.jpg", width = 8, height = 6)
ggsave("output/output_multipliers_type2.pdf", width = 8, height = 6)

#######################################
### Plot type 1 output multipliers

multipliers[text == "Meat",                output_multipliers_t1_lab := output_multipliers_t1 + 0.0]
multipliers[text == "Fish, \nfruit & veg", output_multipliers_t1_lab := output_multipliers_t1 + 0.1]
multipliers[text == "Oils & \nfats",       output_multipliers_t1_lab := output_multipliers_t1 - 2.05]
multipliers[text == "Dairy",               output_multipliers_t1_lab := output_multipliers_t1 + 0.1]
multipliers[text == "Grains & \nstarches", output_multipliers_t1_lab := output_multipliers_t1 - 2.2]
multipliers[text == "Bakery",              output_multipliers_t1_lab := output_multipliers_t1 + 0.0]
multipliers[text == "Other \nfood",        output_multipliers_t1_lab := output_multipliers_t1 - 2.25]
multipliers[text == "Alcohol & \ntobacco", output_multipliers_t1_lab := output_multipliers_t1 + 0.0]
multipliers[text == "Gambling",            output_multipliers_t1_lab := output_multipliers_t1 + 0.05]

multipliers[text == "Meat",                 hjust_lab := "outward"]
multipliers[text == "Fish, \nfruit & veg",  hjust_lab := "inward"]
multipliers[text == "Oils & \nfats",        hjust_lab := "inward"]
multipliers[text == "Dairy",                hjust_lab := "center"]
multipliers[text == "Grains & \nstarches",  hjust_lab := "center"]
multipliers[text == "Bakery",               hjust_lab := "inward"]
multipliers[text == "Other \nfood",         hjust_lab := "center"]
multipliers[text == "Alcohol & \ntobacco"  ,hjust_lab := "inward"]
multipliers[text == "Gambling",             hjust_lab := "inward"]

ggplot(multipliers) +
  aes(x = reorder(Product, -output_multipliers_t1), y = output_multipliers_t1, fill = type, alpha = type2) +
  geom_col(position = "dodge") +
  geom_text(aes(x = reorder(Product, -output_multipliers_t1), y = output_multipliers_t1_lab, label = text, hjust = hjust_lab)) +
  geom_hline(yintercept = 0, color = "black") +
  theme_minimal() +
  scale_x_discrete(labels = NULL) +
  scale_fill_manual(values = c("#fb8500","#9a031e","#5f0f40","#003566")) +
  scale_alpha_manual(values = c(1,0.2)) +
  scale_color_manual(values = c("white","black")) +
  scale_y_continuous(breaks = seq(0,3,0.5)) +
  labs(x = "Product category (ordered by multiplier value)",
       y = "Output Multiplier",
       fill = "") +
  theme(legend.position = "none")  +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank())
ggsave("output/output_multipliers_type1.jpg", width = 8, height = 6)
ggsave("output/output_multipliers_type1.pdf", width = 8, height = 6)


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
multipliers[text == "Alcohol & \ntobacco", gva_multipliers_t2_lab := gva_multipliers_t2 + 0.4]
multipliers[text == "Gambling",            gva_multipliers_t2_lab := gva_multipliers_t2 + 0.15]

multipliers[text == "Meat",                 hjust_lab := "center"]
multipliers[text == "Fish, \nfruit & veg",  hjust_lab := "outward"]
multipliers[text == "Oils & \nfats",        hjust_lab := "inward"]
multipliers[text == "Dairy",                hjust_lab := "outward"]
multipliers[text == "Grains & \nstarches",  hjust_lab := "inward"]
multipliers[text == "Bakery",               hjust_lab := "outward"]
multipliers[text == "Other \nfood",         hjust_lab := "inward"]
multipliers[text == "Alcohol & \ntobacco"  ,hjust_lab := "inward"]
multipliers[text == "Gambling",             hjust_lab := "inward"]

ggplot(multipliers) +
  aes(x = reorder(Product, -gva_multipliers_t2), y = gva_multipliers_t2, fill = type, alpha = type2) +
  geom_col(position = "dodge") +
  geom_text(aes(x = reorder(Product, -gva_multipliers_t2), y = gva_multipliers_t2_lab, label = text, hjust = hjust_lab)) +
  geom_hline(yintercept = 0, color = "black") +
  theme_minimal() +
  scale_x_discrete(labels = NULL) +
  scale_fill_manual(values = c("#fb8500","#9a031e","#5f0f40","#003566")) +
  scale_alpha_manual(values = c(1,0.2)) +
  scale_color_manual(values = c("white","black")) +
  scale_y_continuous(breaks = seq(0,7,1)) +
  labs(x = "Product category (ordered by multiplier value)",
       y = "Grpss Value Added Multiplier",
       fill = "") +
  theme(legend.position = "none")  +
  theme( # remove the vertical grid lines
    panel.grid.major.x = element_blank(),
    panel.grid.minor.x = element_blank())
ggsave("output/gva_multipliers_type2.jpg", width = 8, height = 6)
ggsave("output/gva_multipliers_type2.pdf", width = 8, height = 6)





