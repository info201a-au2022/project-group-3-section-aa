library(ggplot2)
library(dplyr)
library(usmap)



source("../source/by_areas.R")
#MainStates <- map_data("incidence_cases")

state <- data.frame(state.name) %>% 
  rename(state = state.name)

state_map_df <- left_join(state, cases_ratio, by = "state")

map_total_pop <- function(param)  {
  plot <- plot_usmap(data = state_map_df, values = param, color = "blue") +
    scale_fill_continuous(
      low = "white", high = "red", name = "Total population Cancer Rate From 1995 - 2019", label = scales::comma) +
    theme(legend.position = "right") +
    labs(title = "Total population Cancer Rate From 1995 - 2019",
         caption = "A map that indicates how the cancer rate for the population in each state from 1995-2019")
  return(plot)
} 

map_total_pop("total_mortality")
