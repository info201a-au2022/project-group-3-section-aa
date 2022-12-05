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

state <- data.frame(state.name) %>% 
  rename(state = state.name)

state_df <- left_join(state, by_organ_sites, by = "state")

state_codes <- read.csv('../data/state_codes.csv', stringsAsFactors = FALSE)
joined_data <- left_join(state_codes, state_df, by="state")

mortality_by_state <- function(site) {
  cancer_prop <- joined_data %>% 
    filter(organ_sites == site) 
  
  # give state boundaries a white border
  l <- list(color = toRGB("white"), width = 2)
  
  # specify some map projection/options
  g <- list(
    scope = 'usa',
    projection = list(type = 'albers usa'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  # Plot
  p <- plot_geo(cancer_prop, locationmode = 'USA-states') %>%
    add_trace(
      z = ~prop_cases, text = ~state, locations = ~code,
      color = ~prop_cases, colors = c("#4e9665","white","#c26d11")) %>%
    colorbar(title = "Mortality Rate") %>%
    layout(
      title = str_to_title(site),
      geo = g
    )
  return(p)
} 