library(ggplot2)
library(dplyr)
library(usmap)


cancer_file<- read.csv("https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-aa/main/data/by_age_groups.csv", 
                                 header = TRUE, stringsAsFactors = FALSE)
View(cancer_file)
MainStates <- map_data("state")


total_pop <- function() {
  total_pop <- cancer_file %>% 
    group_by(state) %>% 
    filter(year =="year" ) %>% 
    replace(is.na(.),0) %>% 
    select(year, state,total_pop) %>% 
    summarise(total_pop = sum(total_pop) ) 
  return(total_pop)
}
total_pop()

map_total_pop <- function()  {
  plot <- plot_usmap(data = total_pop(), values = "total_pop", color = "blue") +
    scale_fill_continuous(
      low = "white", high = "red", name = "Total population cancer Mortality during year", label = scales::comma) +
    theme(legend.position = "right") +
    labs(title = "Total population of Mortality of cancer during year",
         caption = "A map that indicates how cancer mortality population in each state looks like in year")
  return(plot)
} 
map_total_pop ()