library(tidyverse)
library(dplyr)

data <- read.csv("../data/smoking_data.csv")

#clean the data
data <- data %>% 
  select(Year, State, Smoke.everyday, Smoke.some.days, Former.smoker, Never.smoked) %>% 
  rename(year = Year, state = State, everyday = Smoke.everyday,
         some_days = Smoke.some.days, former_smoker = Former.smoker,
         never = Never.smoked)
