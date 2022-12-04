library(shiny)

ui <- fluidPage(
  includeCSS("styles.css"),
  
  h1("Geographic Areas and Cancer in the US"),
  
  p("To determine whether a state has the possibility of being a cancer cluster, we
    analyze the data for the cancer cases over the total population for an area to
    determine any relationship between one area of living to the cancer risk."),
  
  h2("Incidence and Mortality Rates in Each State"),
  
  div(
    h3("The Incidence Rates in Each State"),
    
    plotOutput("incidence_map"),
    
    h3("The Mortality Rates in Each State"),
    
    plotOutput("mortality_map"),
  ),
  
  p("maps description goes here"),
  
  h2("Mortality Rates for Each Cancer Type by State"),
  
  p("[interactive map goes here]"),
  
  p("[instruction for the interactive map"),
  
  p("[description for the map and any findings]")
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  output$incidence_map <- renderPlot(return(map_total_pop("incidence_ratio")))
  output$mortality_map <- renderPlot(return(map_total_pop("total_mortality")))
  
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)