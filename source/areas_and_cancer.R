library(shiny)

source("by_area_map.R")

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
  
  p("In the first map we can see during the year 1995-2019 the incidence rate of cancer risk
  in each state within the US. Looking at this map, we notice as the color layout, the west 
  side of US having a higher incidence rates compared to the other. In the second map we can
  see during the 1995-2019 the mortality rates caused by cancer we have serveral emphasized on 
  some of the states  California Florida Texas New York[add more map description]"),
  
  
  h2("Mortality Rates for Each Cancer Type by State"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "sites",
        label = "Cancer Sites",
        choices = unique(cases_by_sites$sites),
        selected = "Brain and Other Nervous System"
      )
    ),
    
    mainPanel(
      titlePanel("Mortality Rate by Cancer Sites in a State"),
      plotlyOutput("map"),
    )
  ),
  
  p("[instruction for the interactive map"),
  
  p("[description for the map and any findings]")
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  output$incidence_map <- renderPlot({
    return(map_total_pop("incidence_ratio"))
  })
  
  output$mortality_map <- renderPlot({
    return(map_total_pop("total_mortality"))
  })
  
  output$map <- renderPlotly({
    return(mortality_by_state(input$sites))
  })
  
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)