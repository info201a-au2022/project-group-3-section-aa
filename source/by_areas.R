library(tidyverse)
library(dplyr)

master_data <- read.csv("../data/by_areas.csv")


#CLEAN UP DATASET#
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

#find the ratio of incidence/mortality cases in each census division
incidence_cases <- cancer_cases_in_division("Incidence")
incidence_cases <- incidence_cases %>% 
  rename(incidence_total = total)

mortality_cases <- cancer_cases_in_division("Mortality")
mortality_cases <- mortality_cases %>% 
  rename(mortality_total = total)

#does the population have any relationship with the chance of having cancer
#large population = more chance of having cancer? 









  