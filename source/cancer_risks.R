library(shiny)

ui <- fluidPage(
  includeCSS("styles.css"),
  
  h1("Two Possible Cancer Risk Factors"),
  
  p("In an attempt to figure out some risk factors of cancer, we investigate the two
    datasets, one for pollutions and one for tobacco use in the US to look for any
    correlation between these factors and the risk of having or dying from cancer."),
  
  h2("Pollution"),
  
  p("For pollution, we present four maps which will mainly foucus on how each states of the 
    US being covered with all the pollustions like o3,no2, so2, co"),
  
  plotOutput("map_o3"),
  p("We can see from the map o3 we have Nevada, Utah, Wyoming, Tennessee and North Carolina, Missouri, Indiana has more o3"),
  plotOutput("map_no2"),
  p("We can see from the map no2 we have Arizona, Colorado, Wisconsin, Michigan and New York has more no2"),
  plotOutput("map_so2"),
  p("We can see from the map so2 we have Missouri, Indiana has more so2"),
  plotOutput("map_co"),
  p("We can see from the map co we have Arizona, Colorado,California has more co"),
  
  h2("Tobacco use"),
  
  p("[chart goes here]"),
  
  p("[chart description]")
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  output$map_o3 <- renderPlot({return(map_o3())})
  output$map_no2 <- renderPlot({return(map_no2())})
  output$map_so2 <- renderPlot({return(map_so2())})
  output$map_co <- renderPlot({return(map_co())})
  
}
# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)