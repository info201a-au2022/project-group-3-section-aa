library(shiny)

# Define a new `ui` variable. This variable should be assigned a `fluidPage()`
# layout. The `fluidPage()` layout should be passed the following:
ui <- fluidPage(
  includeCSS("styles.css"),
  #includeScript("index.js"),
  #includeScript("node_modules/lib/lax.min.js"),

  # A first-level header (`h1()`) with the content "First Shiny Website"
  h1("Cancer"),

  h2("Overview"),

  p("Allison Ho, Lolly Zhao, Vicky Huang"),

  p("Our main question is figuring out whether there is a relationship between the demographics
    of people in the US and two potential risk factors for cancer. This question is important
    because we need more information on whether a group of people has a higher chance of having
    cancer than others so that we can develop preventive methods. In addition, understanding this
    relationship can also give us more information on whether a specific kind of gene has any impact
    after we have learned about the societal scope. To address the question, we will use data collected
    by the John Snows Lab, which is validated by the CDC and another dataset collected by CDC to better
    analyze this relationship."),

  h3("Source")
)

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  # Will be next!
}

# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server)