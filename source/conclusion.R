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
  
  p("[summarize P1 + P2]")
)