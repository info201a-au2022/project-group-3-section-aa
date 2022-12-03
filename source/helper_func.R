library(readxl)
library(dplyr)
library(tidyverse)


age_data <- read.csv("../data/by_age_groups.csv")

areas_data <- read.csv("../data/by_areas.csv")

risks <- read_excel("../data/cancer_risk_factors.xlsx")


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

#areas_data
areas_data <- areas_data %>% 
  rename(divisions = Census_Division_Name,
         cases = Count_of_People_Diagnosed_With_Cancer,
         event_type = Cancer_Event_Type,
         population = Population_in_Census_Division,
         based_on_races = Cancer_Frequency_Based_on_Race_And_Ethnicity,
         gender = Gender,
         organ_sites = Cancer_Organ_Site,
         start_year = Data_Collection_Starting_Year,
         end_year = Data_Collection_Ending_Year)

areas_data <- areas_data %>% 
  select(divisions, cases, event_type, population, based_on_races, gender, organ_sites,
         start_year, end_year)

areas_data$cases <- as.integer(areas_data$cases)

##--------------------------------UNDERSTAND THE DATA----------------------------------##

#BY_AGE DATASET
#get a data frame for female or male population only
female_male_num <- function(gender, df) {
  df <- by_age %>% 
    filter(gender == gender) %>% 
    group_by(age_group) %>% 
    summarise(total = sum(population, na.rm = TRUE))
  return(df)
}


#AREAS_DATA
#get the ratio of incidence/mortality cases per census division
cancer_cases_in_division <- function(cancer_type) {
  by_division <- areas_data %>% 
    filter(event_type == cancer_type) %>% 
    group_by(divisions) %>%
    summarise(total = sum(cases, na.rm = TRUE) / sum(population, na.rm = TRUE),
              total_cases = sum(cases, na.rm = TRUE))
  return(by_division)
}









