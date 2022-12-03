library(shiny)

ui <- fluidPage(
  includeCSS("styles.css"),
  
  h1("Two Possible Cancer Risk Factors"),
  
  p("In an attempt to figure out some risk factors of cancer, we investigate the two
    dataset, one for pollution and one for tobacco use in the US to look for any
    correlation between these factors and the risk of having or dying from cancer."),
  
  h2("Pollution"),
  
  p("For pollution, we take a look at data for [list the name of pollutant"),
  
  p("[chart goes here]"),
  
  p("[chart description]"),
  
  h2("Tobacco use"),
  
  p("[chart goes here]"),
  
  p("[chart description]")
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  # Will be next!
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)