library(ggplot2)
library(dplyr)
library(usmap)



source("../source/by_areas.R")
#MainStates <- map_data("incidence_cases")



map_total_pop <- function()  {
  plot <- plot_usmap(data = cases_ratio, values = "incidence_ratio", color = "blue") +
    scale_fill_continuous(
      low = "white", high = "red", name = "Total population cancer Mortality during year", label = scales::comma) +
    theme(legend.position = "right") +
    labs(title = "Total population of Mortality of cancer during year",
         caption = "A map that indicates how cancer mortality population in each state looks like in year")
  return(plot)
} 

map_total_pop()
