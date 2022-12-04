library(shiny)

source("charts_by_age_group.R")

ui <- fluidPage(
  includeCSS("styles.css"),
  
  h1("Age Groups and Cancer"),
  
  div(class = "chart",
    plotOutput("cases_plot")
  ),
  
  div(class = "chart",
      plotOutput("ratio_plot")
  ),  
  
  p("We are interested to see if there is any correlating relationship between age
    and cancer risk. Looking at this bar graph, we notice as the age advance, the
    risk of having cancer at all organ sites increase steadily. [add more graph
    description]"),
  
  h2("The cancer total incidence and mortality rates for each gender (male and female)
     in each age group"),
  
  div(class = "chart",
      plotOutput("gender_plot")
  ),
  
  p("Dive deeper into each age group, we take a look at the ratio of cancer cases for
    each gender to study whether there is any relationship between gender and the rates
    of having cancer. [Describe graph]"),
  
  h2("The Ratio of Different Cancer Types For Each Age Group"),
  
  p("To determine if one age group is more prone to be diagnosed or died from a
    specific cancer type, we analyze the data for individual cancer type for each
    age group. For each of the type and age group, we also look at the incidence rate
    and the mortality rate."),
  
  p("Instruction for the interactive graph")
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  output$cases_plot <- renderPlot(return(pop_by_age()))
  output$ratio_plot <- renderPlot(return(pop_age_ratio()))
  output$gender_plot <- renderPlot(return(female_male()))
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)