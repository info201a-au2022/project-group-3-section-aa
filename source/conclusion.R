library(shiny)

ui <- fluidPage(
  includeCSS("styles.css"),
  
  h1("Primary Takeaway"),
  
  h2("Summary"),
  
  p("[first summary goes here]"),
  
  p("[second summary goes here]"),
  
  p("[third summary goes here]"),
  
  h2("Report"),
  
  p("[summarize P1 + P2]")
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  # Will be next!
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)