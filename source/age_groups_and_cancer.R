library(shiny)
library(plotly)

source("charts_by_age_group.R")

age_page <- fluidPage(
  h1("Age Groups and Cancer"),
  
  div(class = "chart",
      plotOutput("cases_plot")
  ),
  
  div(class = "chart",
      plotOutput("ratio_plot")
  ),  
  
  p("We are interested to see if there is any correlating relationship between age
    and cancer risk. Looking at this bar graph, we notice as the age advance, the
    risk of having cancer at all organ sites increase steadily. As the chart reveals, 
    the number of total cases show a steady growth trend as people aged, with its peak 
    at the age of 65-69, reaching above 57,000,000 total cases. The bar chart depicts 
    the tendency of cancer risks to make people from 50 to 85+ more vulnerable compare 
    to people under the age of 50."),
  
  h2("The cancer total incidence and mortality rates for each gender (male and female)
     in each age group"),
  
  div(class = "chart",
      plotOutput("gender_plot")
  ),
  
  p("Dive deeper into each age group, we take a look at the ratio of cancer cases for
    each gender to study whether there is any relationship between gender and the rates
    of having cancer. As the charts reveals, females tend to have a higher risk in developing
    cancer compare to male, according to data collected by John Snow Labs. A higher incident
    of all types of cancer among female were generally 0.15% higher than that of male. Our 
    research suggest that the differences between the sexes may in part be due to genetic and 
    hormonal risk factors, as well as carcinogenic exposures and lifestyle factors."),
  
  p("We were curious to see what type of cancer is most commonly developed among people, thus
    we can research and develop strategies to pratice avoid potential risk factors in our daily
    life. There are a total of 27 cancer type entries in our chart. Taking a look of this pie chart,
    it revels that Lung and Bronchus were the most commonly developed cancer, based on our data of
    cancer cases from 1999-2016. With Male and Female Breast cancer holding the second place, we 
    see the incident of cancer rate developed among both gender. As we take a look of the yellow-ish
    green on the left of the pie chart, it indicates that Kaposi Sarcoma is the least developed 
    cancer type among people."),
  
  plotOutput("pie"),
  
  h2("The Ratio of Different Cancer Types For Each Age Group"),
  
  p("To determine if one age group is more prone to be diagnosed or died from a
    specific cancer type, we analyze the data for individual cancer type for each
    age group. For each of the type and age group, we also look at the incidence rate
    and the mortality rate."),
  
  p("Instruction for the interactive graph"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "site",
        label = "Cancer Sites",
        choices = unique(cases_by_sites$sites),
        selected = "Brain and Other Nervous System"
      )
    ),
    
    mainPanel(
      titlePanel("Mortality Rate by Cancer Sites"),
      plotlyOutput("sites_plot"),
    )
  )
)
