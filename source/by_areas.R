library(tidyverse)
library(dplyr)
library(plotly)


master_data <- read.csv("data/by_areas.csv")

#CLEAN UP DATASET#
areas_data <- master_data  %>% 
  rename(state = Census_Division_Name,
         cases = Count_of_People_Diagnosed_With_Cancer,
         event_type = Cancer_Event_Type,
         population = Population_in_Census_Division,
         based_on_races = Cancer_Frequency_Based_on_Race_And_Ethnicity,
         gender = Gender,
         organ_sites = Cancer_Organ_Site,
         start_year = Data_Collection_Starting_Year,
         end_year = Data_Collection_Ending_Year)

areas_data <- areas_data %>% 
  select(state, cases, event_type, population, based_on_races, gender, organ_sites,
         start_year, end_year)

areas_data$cases <- as.integer(areas_data$cases)

#find the ratio of incidence/mortality cases in each census division
#we can ask:
#does the population have any relationship with the chance of having cancer
#large population = more chance of having cancer? 

#get the ratio of incidence/mortality cases per census division
cancer_cases_in_division <- function(cancer_type) {
  by_division <- areas_data %>% 
    filter(event_type == cancer_type) %>% 
    group_by(state) %>%
    summarise(total = sum(cases, na.rm = TRUE) / sum(population, na.rm = TRUE),
              total_cases = sum(cases, na.rm = TRUE))
  return(by_division)
}

incidence_cases_by_state <- cancer_cases_in_division("Incidence")
incidence_cases_by_state <- incidence_cases_by_state %>% 
  rename(incidence_ratio = total,
         total_incidence = total_cases)

mortality_cases_by_state <- cancer_cases_in_division("Mortality")
mortality_cases_by_state <- mortality_cases_by_state %>% 
  rename(mortality_total = total,
         total_mortality = total_cases)



#find the total population for each divisions
total_population <- areas_data %>% 
  filter(event_type == "Incidence") %>% 
  group_by(state) %>% 
  summarise(total_pop = sum(population, na.rm = TRUE))


#join incidence dataframe and mortality dataframe and add a column for the total
#population for each divisions
cases_ratio <- left_join(incidence_cases_by_state, mortality_cases_by_state, by = "state")
cases_ratio <- left_join(cases_ratio, total_population, by = "state")


##MAKE AN INTERACTIVE GRAPH THAT ALLOWS USER TO SELECT THE CANCER SITES AND RETURN THE DATA FOR THE
##PROP OF MORTALITY CASES FOR EACH STATE FOR THAT SPECIFIC CANCER SITES
#which organ sites cancer make up the majority of the mortality cases in each state?

#calculate the number of mortality cases for each organ sites in each state
by_organ_sites <- areas_data %>% 
  filter(event_type == "Mortality") %>% 
  group_by(state, organ_sites) %>% 
  summarise(total = sum(cases, na.rm = TRUE))

#calculate the prop of each organ sites cancer over the total mortality case for a
#division

total_mortality_by_state <- cases_ratio %>% 
  select(state, total_mortality)

by_organ_sites <- left_join(by_organ_sites, total_mortality_by_state, 
                            by = "state")

by_organ_sites <- by_organ_sites %>% 
  mutate(prop_cases = total / total_mortality)





  