library("shiny")
#library(rsconnect)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(plotly)

intro_page <- tabPanel(
  "Overview",
  source("./intro_page.R", local = TRUE)$value
)

interactive1 <- tabPanel(
  "Age Group",
  source("./age_groups_and_cancer.R", local = TRUE)$value
)

interactive2 <- tabPanel(
  "Geographic Areas",
  source("./areas_and_cancer.R", local = TRUE)$value
)

interactive3 <- tabPanel(
  "Cancer Risks",
  source("./cancer_risks.R", local = TRUE)$value
)

conclusion_page <- tabPanel(
  "Conclusion",
  source("./conclusion.R", local = TRUE)$value
)

ui <- navbarPage(
  "Cancer",
  intro_page,
  interactive1,
  interactive2,
  interactive3,
  conclusion_page
)

server <- function(input, output, session) {
  
}

shinyApp(ui = ui, server = server, options = list(height = 1080))