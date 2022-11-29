library(readxl)
library(dplyr)
library(tidyverse)

data <- read_excel("/Users/quynhanh/Documents/info201/data/cancer.xlsx")

age_data <- read.csv("/Users/quynhanh/Documents/info201/project/project-group-3-section-aa/data/by_age_groups.csv")

areas_data <- read.csv("/Users/quynhanh/Documents/info201/project/project-group-3-section-aa/data/by_areas.csv")

risks <- read_excel("/Users/quynhanh/Documents/info201/project/project-group-3-section-aa/data/cancer_risk_factors.xlsx")


##--------------------------------CLEANING DATASET-----------------------------------##
by_age <- age_data %>% 
  select(Age_Group, Gender, Count_of_People_Diagnosed_With_Cancer, Cancer_Event_Type, 
         Population_in_Census_Division, Cancer_Frequency_Based_on_Race_And_Ethnicity,
         Cancer_Organ_Site, Data_Collection_Starting_Year, Data_Collection_Ending_Year)

by_age <- by_age %>% 
  rename(age_group = Age_Group,
         gender = Gender,
         cases = Count_of_People_Diagnosed_With_Cancer,
         cancer_event_type = Cancer_Event_Type,
         population = Population_in_Census_Division,
         frequency_based_on_races = Cancer_Frequency_Based_on_Race_And_Ethnicity,
         sites = Cancer_Organ_Site,
         start_year = Data_Collection_Starting_Year,
         end_year = Data_Collection_Ending_Year)


##--------------------------------UNDERSTAND THE DATA----------------------------------##

#get a data frame for female or male population only
female_male_num <- function(gender, df) {
  df <- by_age %>% 
    filter(gender == gender) %>% 
    group_by(age_group) %>% 
    summarise(total = sum(population, na.rm = TRUE))
  return(df)
}











