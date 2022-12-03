library(shiny)


ui <- fluidPage(
  includeCSS("styles.css"),
  
  h1("Age Groups and Cancer"),
  
  p("We are interested to see if there is any correlating relationship between age
    and cancer risk. Looking at this bar graph, we notice as the age advance, the
    risk of having cancer at all organ sites increase steadily. [add more graph
    description]"),
  
  h2("The cancer total incidence and mortality rates for each gender (male and female)
     in each age group"),
  
  p("Dive deeper into each age group, we take a look at the ratio of cancer cases for
    each gender to study whether there is any relationship between gender and the rates
    of having cancer. [Describe graph]"),
  
  h2("The Ratio of Different Cancer Types For Each Age Group"),
  
  p("To determine if one age group is more prone to be diagnosed or died from a
    specific cancer type, we analyze the data for individual cancer type for each
    age group. For each of the type and age group, we also look at the incidence rate
    and the mortality rate."),
  
  p("Instruction for the interactive graph"),
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  # Will be next!
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)