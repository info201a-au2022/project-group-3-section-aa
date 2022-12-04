library(ggplot2)
library(dplyr)
library(tidyverse)

source("by_age_group.R")

#bar graph of total cases rate by age 
cases_in_groups <- cases_in_groups[c(1:2, 11, 3:10, 12:19),]
pop_by_age <- function() {
  pop_chart <- ggplot(data = cases_in_groups) + 
    geom_col(mapping = aes(
    x = age_group, 
    y = total_cases)) + 
    scale_y_continuous(labels = scales::comma) +
    labs(
      x = "age group",
      y = "cancer cases frequency",
      title = "Increase of cancer population by age group"
    )
  
  return(pop_chart)
}

pop_by_age()

#bar graph of ratio by age
pop_age_ratio <- function() {
  ratio_chart <- ggplot(cases_in_groups, aes(x = age_group, y = ratio)) + 
    geom_bar(stat = "identity") + 
    scale_y_continuous(labels = scales::comma) +
    labs(
      x = "age group",
      y = "ratio",
      title = "cancel population ratio by age group"
    )
  return(ratio_chart)
}

pop_age_ratio()

#pie chart of prop by each sites 
total_cases_by_sites <- cases_by_sites %>%
  group_by(sites) %>% 
  summarise(total = sum(total_cases, na.rm = TRUE))

prop_each_sites <- function() {
  prop_chart <- ggplot(total_cases_by_sites, aes(x="", y=total, fill=sites)) + 
    geom_bar(stat="identity", width=1, color="white") +
    coord_polar("y", start=0) +
    theme_void() +
    ggtitle("the number of mortality cases by organization sites")+
    theme(plot.title = element_text(hjust = 0.5, size = 20))
  return(prop_chart)
}

prop_each_sites()

#stacked bar chart of total_cases for female and male
female_male <- function() {
  gender_chart <- ggplot(cases_by_gender, aes(fill = gender, y = prop, x = age_group))  + 
    geom_bar(position="dodge", stat="identity") +
    scale_y_continuous(labels = scales::comma) +
    labs(
      x = "age group",
      y = "properties of cancer population between male and female",
      title = "comparison of male and female cancer properties rates by age group"
    )
  return(gender_chart)
}

female_male()

##MAKE AN INTERACTIVE GRAPH THAT ALLOWS USER TO SELECT THE AGE GROUP AND RETURN THE DATA FOR THE
##PROP OF MORTALITY CASES FOR EACH CANCER SITES FOR THAT SPECIFIC AGE GROUP
mortality_by_sites <- function() {
  prop <- ggplot(cases_by_sites, aes(x = age_group, y = prop)) + 
    geom_bar(stat = "identity") + 
    scale_y_continuous(labels = scales::comma) +
    labs(
      x = "age group",
      y = "properties of motality cases",
      title = "properties of mortality cases for each sites by age group"
    )
  return(prop)
}

mortality_by_sites()
