library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(plotly)

intro_page <- tabPanel(
  "Overview",
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
    ),
  ),
  
  img("", src = "https://i.pinimg.com/564x/3d/dd/c2/3dddc279a80ed0dee468433be51906b7.jpg"),
  
  HTML("<hr>")
)

interactive1 <- tabPanel(
  "Age Group",
  h1("Age Groups and Cancer"),
  
  div(class = "chart",
      plotOutput("cases_plot")
  ),
  
  div(class = "chart",
      plotOutput("ratio_plot")
  ),  
  
  p("We are interested to see if there is any correlating relationship between age
    and cancer risk. Looking at this bar graph, we notice as the age advance, the
    risk of having cancer at all organ sites increase steadily. As the chart reveals, 
    the number of total cases show a steady growth trend as people aged, with its peak 
    at the age of 65-69, reaching above 57,000,000 total cases. The bar chart depicts 
    the tendency of cancer risks to make people from 50 to 85+ more vulnerable compare 
    to people under the age of 50."),
  
  h2("The cancer total incidence and mortality rates for each gender (male and female)
     in each age group"),
  
  div(class = "chart",
      plotOutput("gender_plot")
  ),
  
  p("Dive deeper into each age group, we take a look at the ratio of cancer cases for
    each gender to study whether there is any relationship between gender and the rates
    of having cancer. As the charts reveals, females tend to have a higher risk in developing
    cancer compare to male, according to data collected by John Snow Labs. A higher incident
    of all types of cancer among female were generally 0.15% higher than that of male. Our 
    research suggest that the differences between the sexes may in part be due to genetic and 
    hormonal risk factors, as well as carcinogenic exposures and lifestyle factors."),
  
  p("We were curious to see what type of cancer is most commonly developed among people, thus
    we can research and develop strategies to pratice avoid potential risk factors in our daily
    life. There are a total of 27 cancer type entries in our chart. Taking a look of this pie chart,
    it revels that Lung and Bronchus were the most commonly developed cancer, based on our data of
    cancer cases from 1999-2016. With Male and Female Breast cancer holding the second place, we 
    see the incident of cancer rate developed among both gender. As we take a look of the yellow-ish
    green on the left of the pie chart, it indicates that Kaposi Sarcoma is the least developed 
    cancer type among people."),
  
  plotOutput("pie"),
  
  h2("The Ratio of Different Cancer Types For Each Age Group"),
  
  p("To determine if one age group is more prone to be diagnosed or died from a
    specific cancer type, we analyze the data for individual cancer type for each
    age group. For each of the type and age group, we also look at the incidence rate
    and the mortality rate."),
  
  p("Instruction for the interactive graph"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "site",
        label = "Cancer Sites",
        choices = unique(cases_by_sites$sites),
        selected = "Brain and Other Nervous System"
      )
    ),
    
    mainPanel(
      titlePanel("Mortality Rate by Cancer Sites"),
      plotlyOutput("sites_plot"),
    )
  )
)

interactive2 <- tabPanel(
  "Geographic Areas",
  h1("Age Groups and Cancer"),
  
  div(class = "chart",
      plotOutput("cases_plot")
  ),
  
  div(class = "chart",
      plotOutput("ratio_plot")
  ),  
  
  p("We are interested to see if there is any correlating relationship between age
    and cancer risk. Looking at this bar graph, we notice as the age advance, the
    risk of having cancer at all organ sites increase steadily. As the chart reveals, 
    the number of total cases show a steady growth trend as people aged, with its peak 
    at the age of 65-69, reaching above 57,000,000 total cases. The bar chart depicts 
    the tendency of cancer risks to make people from 50 to 85+ more vulnerable compare 
    to people under the age of 50."),
  
  h2("The cancer total incidence and mortality rates for each gender (male and female)
     in each age group"),
  
  div(class = "chart",
      plotOutput("gender_plot")
  ),
  
  p("Dive deeper into each age group, we take a look at the ratio of cancer cases for
    each gender to study whether there is any relationship between gender and the rates
    of having cancer. As the charts reveals, females tend to have a higher risk in developing
    cancer compare to male, according to data collected by John Snow Labs. A higher incident
    of all types of cancer among female were generally 0.15% higher than that of male. Our 
    research suggest that the differences between the sexes may in part be due to genetic and 
    hormonal risk factors, as well as carcinogenic exposures and lifestyle factors."),
  
  p("We were curious to see what type of cancer is most commonly developed among people, thus
    we can research and develop strategies to pratice avoid potential risk factors in our daily
    life. There are a total of 27 cancer type entries in our chart. Taking a look of this pie chart,
    it revels that Lung and Bronchus were the most commonly developed cancer, based on our data of
    cancer cases from 1999-2016. With Male and Female Breast cancer holding the second place, we 
    see the incident of cancer rate developed among both gender. As we take a look of the yellow-ish
    green on the left of the pie chart, it indicates that Kaposi Sarcoma is the least developed 
    cancer type among people."),
  
  plotOutput("pie"),
  
  h2("The Ratio of Different Cancer Types For Each Age Group"),
  
  p("To determine if one age group is more prone to be diagnosed or died from a
    specific cancer type, we analyze the data for individual cancer type for each
    age group. For each of the type and age group, we also look at the incidence rate
    and the mortality rate."),
  
  p("Instruction for the interactive graph"),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "site",
        label = "Cancer Sites",
        choices = unique(cases_by_sites$sites),
        selected = "Brain and Other Nervous System"
      )
    ),
    
    mainPanel(
      titlePanel("Mortality Rate by Cancer Sites"),
      plotlyOutput("sites_plot"),
    )
  )
)

interactive3 <- tabPanel(
  "Cancer Risks",
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

conclusion_page <- tabPanel(
  "Conclusion",
  
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
  
  p("Our project is not only to find out if cancer is related to age and gender. We also want to delve into 
  the information related to cancer through more intuitive and easy-to-change habits and living environments.
  We also want to find out whether the living environment is related to local chemical pollution, and to determine
  which kind of pollution is more important for cancer. In terms of lifestyle habits, whether tobacco aggravates 
  cancer. This will give people more visual information and allow users to participate in the comparison of pictures
  to understand and check the factors of cancer and thus reduce the mortality rate of cancer."),
  
  h2("Report"),
  
  p("In conclusion, these data are use to understand cancer population growth, cancer burden and trends,
     support cancer research, mesure progress in cancer control, environmental factors encorcement, mesure
    cancer prevention efforts, target action on eliminating disparities, and improve cancer outcomes for all.
    The interative data visualizations tool makes it easy for people to access to and check the latest update
    of cancer related informations, making resources easy for anyone to explore and use. ")
)

ui <- navbarPage(
  "Cancer",
  intro_page,
  interactive1,
  interactive2,
  interactive3,
  conclusion_page
)