library(shiny)

intro_page <- fluidPage(
  div(id = "header",
      div(id = "intro",
          h1("Cancer"),
          
          p("Allison Ho, Lolly Zhao, Vicky Huang"),
          
          h2("Overview"),
          
          p("Our main question is figuring out whether there is a relationship between
      the demographics of people in the US and two potential risk factors for
      cancer. This question is important because we need more information on whether
      a group of people has a higher chance of having cancer than others so that we
      can develop preventive methods. In addition, understanding this relationship
      can also give us more information on whether a specific kind of gene has any
      impact after we have learned about the societal scope. To address the question,
      we will use data collected by the John Snows Lab, which is validated by the
      CDC and another dataset collected by CDC to better analyze this relationship."
          ),
          
          h3("Analyzed Data"),
          
          p("For this project, we analyze Cancer Registry by Age and Area. The data covers information
            from 1999-2016. Rates are per 100,000 persons and are age-adjusted to the 2000 U.S. standard
            population. There are a total of 19 groups for data analization, a total of 327066 entries for
            age data and 1048575 entries for areas data. For Cancer Risk Factors, we analyze data from THE
            CANCER ALTARS, which include 4 common air pollutants."),
          
          h4("Key Findings"),
          
          p("Throughout this project, some of our key findings are cancer populartion growth
          over the years, different gender at risks, different area cancer population patterns, 
          and potential risk factos that affect's people's health conditions. The map visualizations 
          allow us to view rates of cancers or cancer mortality for the entire United States and 
          individual states. Our demographics charts allow people to see rates or numbers of cancers 
          growth by sex, and age group for all cancer types combined for 27 types of cancers. Additionally, 
          we generated county-level model-based estimates for 4 cancer risk factors. The scatter visuliazation
          give a sense of how different potential risk factors affect people's health conditions over time."),
          
          h5("Research Questions"),
          
          p(""),
      ),
  ),
  
  img("", src = "https://i.pinimg.com/564x/3d/dd/c2/3dddc279a80ed0dee468433be51906b7.jpg"),
  
  HTML("<hr>")
)

