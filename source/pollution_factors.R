library(tidyverse)
library(dplyr)

pollution <- read.csv("/Users/quynhanh/Documents/info201/pollution_us_2000_2016.csv")

pollution <- pollution %>% 
  select(State, NO2.AQI, O3.AQI, SO2.AQI, CO.AQI) %>% 
  rename(state = State)

#find the mean of all the pollutants for each state
pollution_factors <- pollution %>% 
  group_by(state) %>% 
  summarise(no2 = mean(NO2.AQI, na.rm = TRUE),
            o3 = mean(O3.AQI, na.rm = TRUE),
            so2 = mean(SO2.AQI, na.rm = TRUE),
            co = mean(CO.AQI, na.rm = TRUE))

write.csv(pollution_factors, "/Users/quynhanh/Documents/info201/project/project-group-3-section-aa/data/pollution_factors.csv")

#join with cancer cases for each state data frame
factors_for_cancer <- left_join(pollution_factors, cases_ratio, by = c("state" = "divisions"))


