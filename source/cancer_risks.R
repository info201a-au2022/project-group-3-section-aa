library(shiny)

source("pollution_factors.R")

ui <- fluidPage(
  includeCSS("styles.css"),
  
  h1("A Possible Cancer Risk Factors"),
  
  p("In an attempt to figure out some risk factors of cancer, we investigate a
    datasets pollutions to look for any correlation between these factors and the
    risk of having or dying from cancer."),
  
  h2("Pollution"),
  
  p("The air we breathe every day has a mixture of pollutants that are invisible 
  to the naked eye, invisible pollutants from our living environment and workplace, 
  and some natural risks that have a huge impact on our health. In some cases it can 
  lead to cancer.For pollution, we present four maps which will mainly foucus on how 
  each states of the US being covered with all the pollustions like o3,no2, so2, co"),
  
  plotOutput("map_o3"),
  p("O3 (Ozone) caused by the car gas fixed in the air would cause breathing difficulties
    which woule lead to cancer. In the mapO3 we have Nevada, Utah, Wyoming, Tennessee 
    and North Carolina, Missouri, Indiana has more o3"),
  plotOutput("map_no2"),
  p("No2(Nitrogen Dioxide) gets in the air by burning fuel. Breathing air have a higher
    concentration would damage human respiratory system.We can see from the map no2 we 
    have Arizona, Colorado, Wisconsin, Michigan and New York has more no2"),
  plotOutput("map_so2"),
  p("So2(Sulfur dioxide) as a air pollutant which will irritates the skin and mucous
  membranes of eyes, nose,throat, and lungs We can see from the map so2 we have Missouri, 
  Indiana has more so2"),
  plotOutput("map_co"),
  p("Co (Carbon Monoxide) as a poisonous, colorless, odorless gas in the air. Co has the 
    ability that to blend into blood transforming in huamn body, reducing the ability of blood
    to carry oxygen.We can see from the map co we have Arizona, Colorado,California has more co"),
  
  
  p("Select the pollutants that you want to see how it related to the cancer Mortality rate"),
  sidebarLayout(
    sidebarPanel(
      radioButtons("radio", 
                   label = h3("Pollutants"),
                   choices = list("NO2", "SO2", "CO", "O3"), 
                   selected = "NO2"),
    ),
    
    mainPanel(
      titlePanel("Pollutants and Mortality Rate"),
      plotlyOutput("scatter"),
    )
  ),
)

  p("Some of the above-mentioned contaminants used in U.S. workplaces and released
    into the environment are carcinogenic and contribute to causing cancer. In addition, 
    some of these chemicals are known or suspected to induce cancer in multiple organs. 
    We hope that state governments will focus on more energy-efficient ways to keep these 
    cancer-causing factors under control.")

# This defines a server that doesn't do anything yet, but is needed to run the app.
server <- function(input, output) {
  output$map_o3 <- renderPlot({return(map_o3())})
  output$map_no2 <- renderPlot({return(map_no2())})
  output$map_so2 <- renderPlot({return(map_so2())})
  output$map_co <- renderPlot({return(map_co())})
  
  output$scatter <- renderPlotly({
    if (input$radio == "NO2") {
      return(no2_scatter())
    } else if (input$radio == "SO2") {
      return(so2_scatter())
    } else if (input$radio == "O3") {
      return(o3_scatter())
    } else {
      return(co_scatter())
    }
  })
}
# Create a new `shinyApp()` using the above ui and server
shinyApp(ui = ui, server = server, options = list(height = 1080))