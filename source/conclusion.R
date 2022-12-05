library(shiny)

ui <- fluidPage(
  includeCSS("styles.css"),
  
  h1("Primary Takeaway"),
  
  h2("Summary"),
  
  p("While cancer affects people of all ages, areas, and sexes, it does not always affect them
    equally. Differences in genetices, hormones, enviromental exposures, and other factors
    can lead to differences in risk among different groups of people. For most cancers, though,
    increasing age is the most important risk factor."),
  
  p("Our research tells us that there is gender differences in cancer suseceptibility. In childhood 
    cancer, there are no significant difference between male and female. In genenal, Females tend to
    have a higher risk in developing cancer, Accodring to our data from John Snow Labs.The rates 
    are per 100,000 persons, indicating the most vulnerable age group to be 40-45. The results are 
    age-adjusted to the 2000 U.S. standard population. Our research is a little suprsing because the
    Internet has posted articles about males are at higher risk than females for cancer. However,
    our research shows complitely oppsite result, this variation might be due to the fact that we
    have a big data that was collected from 1999-2016, with 27 types of cancer cites combined, variations
    might appear."),
  
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