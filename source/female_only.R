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



#select needed data columns
cancer_by_ages <- ages %>% 
  select(gender, ethnicity, age_group, cases, population, frequency)

unique_gender <- cancer_by_ages %>% 
  filter(gender == "Female") %>% 
  mutate(count = n())

unique_ages <- cancer_by_ages %>% 
  distinct(age_group)

#latest year
latest_year <- ages %>% 
  filter(Data_Collection_Starting_Year == max(Data_Collection_Starting_Year)) %>% 
  filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>% 
  filter(Cancer_Event_Type == "Mortality")

#select cases for female for all races
female_cases <- latest_year %>% 
  filter(ethnicity == "All Races") %>% 
  filter(gender == "Female") %>% 
  select(gender, ethnicity, age_group, cases, population, frequency)

#bar chart
female_only_chart <-ggplot(female_cases, aes(x = age_group, y = cases)) +
  geom_bar(stat="identity")
female_only_chart

#I include this chart to compare the mortality cancer cases in each age group in
#the US for all races for female only with data collected beginning in 2016. This data
#also use the data for cancer at all sites. From looking at this data, I can see that
#the age group 85+ have the highest number of deaths. Moreover, there is an increase
#trend in the number of mortality cases as the age groups get higher.
