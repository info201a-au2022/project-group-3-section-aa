library(ggplot2)
library(dplyr)
library(usmap)

pollution <- read.csv("../data/pollution_factors.csv")
View(pollution)

#Code for Graph goes here
pollution_no2<- function() {
  pollution_no2 <- pollution %>% 
    select(state, no2)
  return(pollution_no2)
}

pollution_no2()

map_no2 <- function()  {
  plot <- plot_usmap(data = pollution_no2(), values = "no2", color = "blue") +
    scale_fill_continuous(
      low = "white", high = "red", name = "no2 cases in state", label = scales::comma) +
    theme(legend.position = "right") +
    labs(title = "no2 cases in state",
         caption = "A map that indicates how pollution no2 effect cancer in state looks like")
  return(plot)
} 
map_no2()

pollution_o3<- function() {
  pollution_o3 <- pollution %>% 
    select(state, o3)
  return(pollution_o3)
}

pollution_o3()

map_o3 <- function()  {
  plot <- plot_usmap(data = pollution_o3(), values = "o3", color = "purple") +
    scale_fill_continuous(
      low = "white", high = "red", name = "o3 cases in state", label = scales::comma) +
    theme(legend.position = "right") +
    labs(title = "o3 cases in state",
         caption = "A map that indicates how pollution o3 effect cancer in state looks like")
  return(plot)
} 
map_o3()


pollution_so2<- function() {
  pollution_so2 <- pollution %>% 
    select(state, so2)
  return(pollution_so2)
}

pollution_no2()

map_so2 <- function()  {
  plot <- plot_usmap(data = pollution_so2(), values = "so2", color = "black") +
    scale_fill_continuous(
      low = "white", high = "pink", name = "so2 cases in state", label = scales::comma) +
    theme(legend.position = "pink") +
    labs(title = "so2 cases in state",
         caption = "A map that indicates how pollution so2 effect cancer in state looks like")
  return(plot)
} 
map_so2()


pollution_co<- function() {
  pollution_co <- pollution %>% 
    select(state, co)
  return(pollution_co)
}

pollution_co()

map_co <- function()  {
  plot <- plot_usmap(data = pollution_co(), values = "co", color = "green") +
    scale_fill_continuous(
      low = "white", high = "red", name = "co cases in state", label = scales::comma) +
    theme(legend.position = "right") +
    labs(title = "co cases in state",
         caption = "A map that indicates how pollution co effect cancer in state looks like")
  return(plot)
} 
map_co()
