library(tidyverse)
library(dplyr)

master_data <- read.csv("/Users/quynhanh/Documents/info201/project/project-group-3-section-aa/data/by_areas.csv")


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


#find the total population for each census division

  