library(shiny)
library(tidyverse)
library(dplyr)
library(ggplot2)
library(plotly)

intro_page <- tabPanel(
  includeCSS("styles.css"),
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
  
  p("Select the Cancer Sites from the drop down menu to view the bar chart for the
    mortality rate for each age group."),
  
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
  h1("Geographic Areas and Cancer in the US"),
  
  p("To determine whether a state has the possibility of being a cancer cluster, we
    analyze the data for the cancer cases over the total population for an area. The
    finding we gain will help determine if there is any relationship between one area
    of living to the cancer risk."),
  
  h2("Incidence and Mortality Rates in Each State"),
  
  div(
    h3("The Incidence Rates in Each State"),
    
    plotOutput("incidence_map"),
    
    p("Here we have cancer incidence map and our project analyze the incidence rate 
    which is the number of new cancers of a given site/type that occur in a given 
    population during the year 1995-2019, usually expressed as the number of cancers
    per 100,000 at-risk population. In the map we can see during the year 1995-2019 
    the incidence rate of cancer risk in each state within the US. As the map present, 
    we notice as the darker red color shown on the east side of the US reveals that that 
    the east of US having a higher cancer incidence rates compared to the other side of 
    the US. In the eastern part of the country, where the incidence rate is disproportionately 
    high which worth to poin out that those states like Florida, Pennstkvania, 
    West Virginia, Maine."),
    
    h3("The Mortality Rates in Each State"),
    
    plotOutput("mortality_map"),
  ),
  
  p(" In the second map we are analyze cancer mortality which refers to the number 
  of deaths from cancer as the basic cause of death in a specific population within
  the year 1995-2019. Cancer mortality is usually expressed as the number of deaths 
  from cancer per 100,000 population.In this map we will see the phenomenon of cancer
  mortality rate spread out by state in US. As the dark red color present here California
  has the highest cancer mortality rate compare to Florida, Texas, New York where they are
  also have a higher rate of cancer mortality rate.[Note : The rankings by state do not
  take into account specific demographic characteristics of other states that may affect
  mortality levels."),
  
  
  h2("Mortality Rates for Each Cancer Type by State"),
  
  p("Chose the name of the cancer sites from the drop down menu to view the distribution
    of the mortality rates across the states in the US."),
  
  sidebarLayout(
    sidebarPanel(
      selectInput(
        "sites",
        label = "Cancer Sites",
        choices = unique(cases_by_sites$sites),
        selected = "Brain and Other Nervous System"
      )
    ),
    
    mainPanel(
      titlePanel("Mortality Rate by Cancer Sites in a State"),
      plotlyOutput("map"),
    )
  ),
  
  p("Cancer rate patterns by state"),
  
  p("What we have above is the mortality rates for each cancer type by state. User
  can select which cancer sites you interested at the right side map will show  mortality 
  rate of each states in the US caused by that cancer type. The whole purples of the entire 
  site of our project is to present direct map wish to assit that people developing 
  guidelines, policy, or legislation to strengthen or enhance cancer control efforts.
  Conducting special studies to advance clinical, epidemiologic, and health services 
  research. Providing information to help state registries improve the quality and usefulness
  of their data and to link with other databases."),
  
  p("Developing guidelines, policy, or legislation to strengthen or enhance cancer control efforts.
  Conducting special studies to advance clinical, epidemiologic, and health services research.
  Providing information to help state registries improve the quality and usefulness of their 
  data and to link with other databases.")
)

interactive3 <- tabPanel(
  "Cancer Risks",
  h1("A Possible Cancer Risk Factor"),
  
  p("In an attempt to figure out a possible risk factor of cancer, we investigate a
    dataset about different type of pollutants in the US to look for any correlation
    between these factors and the risk of having or dying from cancer."),
  
  h2("Pollution"),
  
  p("The air we breathe every day has a mixture of pollutants that are invisible 
  to the naked eye, invisible pollutants from our living environment and workplace, 
  and some natural risks that have a huge impact on our health. In some cases it can 
  lead to cancer.For pollution, we present four maps which will mainly foucus on how 
  each states of the US being covered with all the pollutions like o3,no2, so2, co"),
  
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
  
  p("To determine any correlation between one type of pollutants to cancer, we take a look
    at these scatterplot. On the x-axis is the mean of emission for a pollutant and
    y-axis represents the mortality rate for cancer in each state."),
  
  p("Click on a button to see the scatterplot for the corresponding pollutants"),
  
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
  
  p("Looking at all 4 scatterplots, we can see that there is indeed a correlation between
    pollution and cancer, although it is not strong. Out of the 4, NO2 has the strongest
    relationship with cancer. Therefore, we can conclude that it is worth taking a closer
    look at these pollutants to better understand the possible relationship between them
    and the cancer mortality rate.")
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
  
  p("Besides analyzing the data to look for relationship between cancer and age and cancer
  and area, we also want to delve into the possible risk of cancer through living environments,
  identifying whether pollution has any effect on the incidence rate of cancer. If so, which
  kind of pollutant has more effect onn cancer. This will give people more visual information
  and allow users to participate in the comparison of pictures to understand and check the
    factors of cancer.Thus, reduce the mortality rate of cancer."),
  
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