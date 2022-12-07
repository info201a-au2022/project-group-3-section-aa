library(shiny)

conclusion <- fluidPage(
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
    are per 100,000 persons, indicating the most vulnerable age group at risk to be 40-45. The results are 
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
    of cancer related informations, making resources easy for anyone to explore and use. The map visualizations
    allow us to view rates of cancers or cancer mortality for the entire United States and individual states. Our
    demographics charts allow people to see rates or numbers of cancers groth by sex, and age group for all cancer
    types combined for 27 types of cancers. Additionally, we generated county-level model-based estimates for 4 
    cancer risk factors. The scatter visuliazation give a sense of how different potential risk
    factors affect people's health conditions over time. ")
)