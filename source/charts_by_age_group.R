library(ggplot2)
library(dplyr)
library(tidyverse)

source("../source/by_age_group.R")

#bar graph of total cases rate by age 
pop_by_age <- ggplot(data = cases_in_groups) +
    geom_col(mapping = aes(
      x = age_group, 
      y = total_cases)) + 
    scale_y_continuous(labels = scales::comma) +
    labs(
      x = "age group",
      y = "cancer cases frequency",
      title = "Increase of cancer population by age group"
    )
pop_by_age

#bar graph of ratio by age
pop_age_ratio <- ggplot(cases_in_groups, aes(x = age_group, y = ratio))+
  geom_bar(stat = "identity") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    x = "age group",
    y = "ratio",
    title = "cancel population ratio by age group"
  )
pop_age_ratio

#pie chart of prop by each sites 
prop_each_sites <- ggplot(cases_by_sites, aes(x="", y=prop, fill=sites)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  theme_void() +
  ggtitle("the number of mortality cases by organization sites")+
  theme(plot.title = element_text(hjust = 0.5, size = 20))
prop_each_sites

#stacked bar chart of total_cases for female and male
female_male <- ggplot(cases_by_gender, aes(fill = gender, y = prop, x = age_group))  + 
  geom_bar(position="dodge", stat="identity") +
  scale_y_continuous(labels = scales::comma) +
  labs(
    x = "age group",
    y = "properties of cancer population between male and female",
    title = "comparison of male and female cancer properties rates by age group"
  )
female_male
