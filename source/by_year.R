
library(ggplot2)
library(dplyr)

cancer_file <- "https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-aa/main/data/cancer_by_ages.csv"
ages <- read.csv(cancer_file, header = TRUE, stringsAsFactors = FALSE)
View(ages)

#change columns name
colnames(ages)[1] <- "age_group"
colnames(ages)[4] <- "cases"
colnames(ages)[6] <- "population"
colnames(ages)[7] <- "ethnicity"
colnames(ages)[8] <- "frequency"
colnames(ages)[9] <- "gender"
colnames(ages)[11] <- "start_year"

#used data columns
by_year_chart <- function() {
  data <- ages %>% 
    filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>% 
    filter(Cancer_Event_Type == "Mortality") %>% 
    filter(ethnicity == "All Races")
  
  #get the total cases for each year
  data <- data %>% 
    group_by(start_year) %>% 
    summarise(total_cases = sum(cases)) %>% 
    select(start_year, total_cases)
  
  #chart
  chart <- ggplot(data, aes(x=start_year, y=total_cases)) + 
    geom_line()
  
  return(chart)
}


