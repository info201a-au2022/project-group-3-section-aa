library(tidyverse)
library(dplyr)

data <- read.csv("../data/smoking_data.csv")

#clean the data
data <- data %>% 
  select(Year, State, Smoke.everyday, Smoke.some.days, Former.smoker, Never.smoked) %>% 
  rename(year = Year, state = State, everyday = Smoke.everyday,
         some_days = Smoke.some.days, former_smoker = Former.smoker,
         never = Never.smoked)

data <- data %>% 
  group_by(state) %>% 
  summarise(everyday = mean(everyday, na.rm = TRUE),
            some_days = mean(some_days, na.rm = TRUE),
            former_smoker = mean(former_smoker, na.rm = TRUE),
            never = mean(never, na.rm = TRUE))

#join this with mortality rate and incidence rate
total_mo_state <- state_df %>% 
  group_by(state) %>% 
  summarise(total_cases = sum(total_mortality, na.rm = TRUE),
            mean_prop = mean(prop_cases, na.rm = TRUE))

tobacco_use <- left_join(data, total_mo_state, by = "state")