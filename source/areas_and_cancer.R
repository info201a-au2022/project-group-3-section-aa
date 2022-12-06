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
    
    p("Here we have cancer incidence map and our project analyze the incidence rate 
    which is the number of new cancers of a given site/type that occur in a given 
    population during the year 1995-2019, usually expressed as the number of cancers
    per 100,000 at-risk population. In the map we can see during the year 1995-2019 
    the incidence rate of cancer risk in each state within the US. As the map present, 
    we notice as the darker red color shown on the east side of the US reveals that that 
    the east of US having a higher cancer incidence rates compared to the other side of 
    the US. In the eastern part of the country, where the incidence rate is disproportionately 
    high which worth to poin out that those states like Florida, Pennstkvania, 
    West Virginia, Maine."),
    
    h3("The Mortality Rates in Each State"),
    
    plotOutput("mortality_map"),
  ),
  
  p(" In the second map we are analyze cancer mortality which refers to the number 
  of deaths from cancer as the basic cause of death in a specific population within
  the year 1995-2019. Cancer mortality is usually expressed as the number of deaths 
  from cancer per 100,000 population.In this map we will see the phenomenon of cancer
  mortality rate spread out by state in US. As the dark red color present here California
  has the highest cancer mortality rate compare to Florida, Texas, New York where they are
  also have a higher rate of cancer mortality rate.[Note : The rankingsby state do not take 
  into account specific demographic characteristics of other states that may affect
  mortality levels.]"),

  
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
  
  p("Cancer rate patterns by state"),
  
  p("What we have above is the mortality rates for each cancer type by state. User
  can select which cancer sites you interested at the right side map will show  mortality 
  rate of each states in the US caused by that cancer type. The whole purples of the entire 
  site of our project is to present direct map wish to assit that people developing 
  guidelines, policy, or legislation to strengthen or enhance cancer control efforts.
  Conducting special studies to advance clinical, epidemiologic, and health services 
  research. Providing information to help state registries improve the quality and usefulness
  of their data and to link with other databases.")
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
shinyApp(ui = ui, server = server, options = list(height = 1080))