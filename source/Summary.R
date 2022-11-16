library(ggplot2)
library(dplyr)

#read the dataset
cancer_file <- "https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-aa/main/data/by_age_groups.csv"
ages <- read.csv(cancer_file, header = TRUE, stringsAsFactors = FALSE)

#change columns name
colnames(ages)[1] <- "age_group"
colnames(ages)[4] <- "cases"
colnames(ages)[6] <- "population"
colnames(ages)[7] <- "ethnicity"
colnames(ages)[8] <- "frequency"
colnames(ages)[9] <- "gender"

#latest year for all cancer sites combined, for all races
latest_year <- ages %>%
  filter(Data_Collection_Starting_Year == max(Data_Collection_Starting_Year)) %>%
  filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>%
  filter(Cancer_Event_Type == "Mortality") %>%
  filter(ethnicity == "All Races") %>%
  select(cases)
View(latest_year)


summary_info <- list()

#number of mortality cases in 2016 for all races and all gender in all age groups
summary_info$num_observations <- nrow(latest_year)

#the max number of cases
summary_info$max_cases <- latest_year %>%
  filter(cases == max(cases, na.rm = T)) %>%
  pull(cases)

#the min number of cases
summary_info$min_cases <- latest_year %>%
  filter(cases == min(cases, na.rm = T)) %>%
  pull(cases)

#the mean of cases
summary_info$avg_cases <- mean(latest_year$cases)

#the standard deviation of cases
summary_info$sd <- sd(latest_year$cases)

?quantile
#first quartile (25%) of cases
summary_info$quartiles_25 <- quantile(latest_year$cases, probs = c(0.25))[1]

#third quartile (75%) of cases
summary_info$quartiles_75 <- quantile(latest_year$cases, probs = c(0.75))[1]

#IQR = inter quartile range
summary_info$iqr <- summary_info$quartiles_75 - summary_info$quartiles_25
