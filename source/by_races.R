
library(ggplot2)
library(tidyverse)
cancer_file <- "https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-aa/main/data/cancer_by_ages.csv"
ages <- read.csv(cancer_file, header = TRUE, stringsAsFactors = FALSE)

#change columns name
colnames(ages)[1] <- "age_group"
colnames(ages)[4] <- "cases"
colnames(ages)[6] <- "population"
colnames(ages)[7] <- "ethnicity"
colnames(ages)[8] <- "frequency"
colnames(ages)[9] <- "gender"

#used data columns
data <- ages %>% 
  filter(Data_Collection_Starting_Year == max(Data_Collection_Starting_Year)) %>% 
  filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>% 
  filter(Cancer_Event_Type == "Mortality") %>% 
  select(ethnicity, cases)


#get cases for each race
by_races <- data %>% 
  group_by(ethnicity) %>% 
  summarise(total_cases = sum(cases, na.rm = TRUE))


#get the number of cases for all races
all_races_total_cases <- by_races %>% 
  filter(ethnicity == "All Races") %>% 
  pull(total_cases)

#find the proportion of cases for each race
by_races <- by_races %>% 
  mutate(prop = total_cases / all_races_total_cases)
by_races <- by_races[-1,]

#chart
chart_races <- ggplot(by_races, aes(x = "", y = prop, fill=ethnicity)) +
  geom_bar(stat="identity", width=1) +
  coord_polar("y", start=0)
chart_races

#I include this chart