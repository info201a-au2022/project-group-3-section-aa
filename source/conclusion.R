library(shiny)

conclusion <- fluidPage(
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
  
  h2("Conclusion"),
  
  p("Cancer, a disease in which abnormal cells divide uncontrollably and destroy body tissue, is the second leading 
  cause of death in the United States, exceeded only by heart disease. One of every five deaths in the United States 
  is due to cancer. Thanks to the development of medical care, hospitalization, research findings, and technology, the 
  survival rate of many types of cancers are improving. 
  
  To conclude our project, we want to reiterate some of our key findings. First and foremost, our data revels that age 
  increase is the major factor that lead to cancer, and it is considered as an unavoidable factor. As we dive deeper, 
  we find out that female are at a 0.15%, a slightly higher risk at getting caner. As we move along and learn about the 
  27 types of cancer from our data, we discovered that Breast and Lung cancers were the most commonly developed cancers 
  in the U.S., with an increase of 12% of total number of new cases. Our interactive data visualizations tool makes it easy 
  for people to access to and check the latest update of cancer related informations, making resources easy for anyone to 
  explore and use. The map visualizations allow viewers to see rates of cancers or cancer mortality for the entire United States 
  and individual states. The interactive bar chart allow viewers to select different states for details, and the colors differentiate 
  different levels of rate for a better. Our demographics charts allow people to see rates or numbers of cancers growth by sex, and 
  age group for all cancer types combined for 27 types of cancers. According to CDC, the rates of cancer diagnoses and cancer deaths are 
  impacted by changes in exposure to risk factors. Took that into consideration, we generated county-level model-based estimates for 4 
  cancer risk factors. The scatter plot visualization give a sense of how different potential risk factors affect people's health 
  conditions over time.

  We hope these data can be used use to understand cancer population growth, cancer burden and trends, support cancer research, 
  measure progress in cancer control, environmental factors enforcement, measure cancer prevention efforts, target action on 
  eliminating disparities, and improve cancer outcomes for all. "),
)