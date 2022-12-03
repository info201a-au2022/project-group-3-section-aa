library(dplyr)
library(tidyverse)
library(ggplot2)

age_data <- read.csv("../data/by_age_groups.csv")

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


##--------------------------------DATA WRANGLING-----------------------------------##

#find the ratio of cancer cases for each age group
cases_in_groups <- by_age %>% 
  group_by(age_group) %>% 
  summarise(total_cases = sum(cases, na.rm = TRUE),
            ratio = sum(cases, na.rm = TRUE) / sum(population, na.rm = TRUE))

#find the age group with the highest cancer case
highest_age_group <- cases_in_groups %>% 
  filter(ratio == max(ratio)) %>% 
  pull(age_group)

#find out if the mortality cases or incidence cases are higher for each age group
find_mortality_cases <- function() {
  mortality_cases <- by_age %>% 
    filter(cancer_event_type == "Mortality") %>% 
    group_by(age_group) %>% 
    summarise(total_mortality = sum(cases, na.rm = TRUE))
  return(mortality_cases)
}

find_incidence_cases <- function() {
  incidence_cases <- by_age %>% 
    filter(cancer_event_type == "Incidence") %>% 
    group_by(age_group) %>% 
    summarise(total_incidence = sum(cases, na.rm = TRUE))
  return(incidence_cases)
}

mortality_cases = find_mortality_cases()
incidence_cases = find_incidence_cases()

#calculate the ratio for each event over the total cases for each age group
cases_by_type <- by_age %>% 
  group_by(age_group) %>% 
  summarise(total_cases = sum(cases, na.rm = TRUE))

cases_by_type <- left_join(cases_by_type, mortality_cases, by = "age_group")
cases_by_type <- left_join(cases_by_type, incidence_cases, by = "age_group")

cases_by_type <- cases_by_type %>% 
  mutate(mortality_prop = total_mortality / total_cases,
         incidence_prop = total_incidence / total_cases)

#find the age group with the highest mortality case
highest_mortality_group <- cases_by_type %>% 
  filter(mortality_prop == max(mortality_prop)) %>% 
  pull(age_group)

#find the age group with the highest incidence case
highest_incidence_group <- cases_by_type %>% 
  filter(incidence_prop == max(incidence_prop)) %>% 
  pull(age_group)

#get a data frame for female or male population only
female_male_num <- function(gender, df) {
  df <- by_age %>% 
    filter(gender == gender) %>% 
    group_by(age_group) %>% 
    summarise(total = sum(population, na.rm = TRUE))
  return(df)
}

female_total <- female_male_num("Female", female_total) %>% 
  rename(female_total = total)

male_total <- female_male_num("Male", male_total) %>% 
  rename(male_total = total)

female_male <- left_join(female_total, male_total, by = "age_group")

#find the gender ratio for each age group that has cancer case
total_cases <- female_male %>% 
  mutate(female_prop = female_total / cases_in_groups$total_cases,
         male_prop = male_total / cases_in_groups$total_cases)


##MAKE AN INTERACTIVE GRAPH THAT ALLOWS USER TO SELECT THE AGE GROUP AND RETURN THE DATA FOR THE
##PROP OF MORTALITY CASES FOR EACH CANCER SITES FOR THAT SPECIFIC AGE GROUP

#calculate the number of mortality cases for each organ sites for each age group
cases_by_sites <- by_age %>% 
  filter(cancer_event_type == "Mortality") %>% 
  group_by(age_group, sites) %>% 
  summarise(total_cases = sum(cases, na.rm = TRUE))

#get the total mortality cases for each age group
cases_by_sites <- left_join(cases_by_sites, mortality_cases, by = "age_group")

#calculate the prop of each organ sites cancer over the total mortality case for an
#age group
cases_by_sites <- cases_by_sites %>% 
  mutate(prop = total_cases / total_mortality)

cases_by_sites <- cases_by_sites[!cases_by_sites$sites == "All Cancer Sites Combined", ]


##BAR CHART FOR THE RATIO OF CANCER CASES OVER TOTAL POPULATION FOR EACH AGE GROUP
ggplot(cases_in_groups, aes(x = age_group, y = ratio))+ 
  geom_bar(stat = "identity")


