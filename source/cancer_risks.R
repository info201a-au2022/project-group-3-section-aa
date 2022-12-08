library(shiny)

source("pollution_factors.R")

risks_page <- fluidPage(
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
  
  p("No2 (Nitrogen Dioxide) gets in the air by burning fuel. Breathing air have a higher
    concentration would damage human respiratory system.We can see from the map no2 we 
    have Arizona, Colorado, Wisconsin, Michigan and New York has more no2"),
  
  plotOutput("map_so2"),
  
  p("So2 (Sulfur dioxide) as a air pollutant which will irritates the skin and mucous
  membranes of eyes, nose,throat, and lungs We can see from the map so2 we have Missouri, 
  Indiana has more so2"),
  
  plotOutput("map_co"),
  
  p("Co (Carbon Monoxide) as a poisonous, colorless, odorless gas in the air. Co has the 
    ability that to blend into blood transforming in huamn body, reducing the ability of blood
    to carry oxygen.We can see from the map co we have Arizona, Colorado,California has more co"),
  
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
  )
)
