library(ggplot2)
library(dplyr)

cancer_file <- "https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-aa/main/data/cancer_by_ages.csv"
ages <- read.csv(cancer_file, header = TRUE, stringsAsFactors = FALSE)

#change columns name
colnames(ages)[1] <- "age_group"
colnames(ages)[4] <- "cases"
colnames(ages)[6] <- "population"
colnames(ages)[7] <- "ethnicity"
colnames(ages)[8] <- "frequency"
colnames(ages)[9] <- "gender"
colnames(ages)[11] <- "start_year"

#used data columns

data <- ages %>% 
  filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>% 
  filter(Cancer_Event_Type == "Mortality") %>% 
  filter(ethnicity == "All Races")

#get the total cases for each year
data <- data %>% 
  group_by(start_year) %>% 
  summarise(total_cases = sum(cases)) %>% 
  select(start_year, total_cases)

#chart
by_year_chart <- ggplot(data, aes(x=start_year, y=total_cases)) + 
  geom_line()
by_year_chart

#I include this chart to show the total mortality cases for all races in all cancer
#sites for all age groups and all gender. Looking at this graph, I can see that the
#total cases from 1999 to 2016 for each year are around the same, the only exception is 2012, where
#it skyrocket to more than 7000000 cases. Moreover, looking closely at the graph, I can
#see a small increase in the number of cases starting from 2014. With this chart, I
#can understand better the trend of cancer cases in the US throughout the years.