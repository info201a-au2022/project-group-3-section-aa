library(ggplot2)
library(dplyr)
library(usmap)

pollution <- read.csv("../data/pollution_factors.csv")
View(pollution)

#Code for Graph goes here
pollution_no2<- function() {
  pollution_no2 <- pollution %>% 
    group_by(state) %>% 
    select(state,no2) %>% 
    summarise(no2 = sum(no2) ) 
  return(pollution_no2)
}
pollution_no2()

map_no2 <- function()  {
  plot <- plot_usmap(data = no2, values = "no2", color = "blue") +
    scale_fill_continuous(
      low = "white", high = "red", name = "no2 cases in state", label = scales::comma) +
    theme(legend.position = "right") +
    labs(title = "no2 cases in state",
         caption = "A map that indicates how pollution no2 effect cancer in state looks like")
  return(plot)
} 
map_no2 ()
