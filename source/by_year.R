
library(ggplot2)
library(dplyr)

cancer_file <- "/Users/quynhanh/Documents/info201/project/project-group-3-section-aa/data/cancer_by_ages.csv"
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
data <- ages %>% 
  filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>% 
  filter(Cancer_Event_Type == "Mortality") %>% 
  filter(ethnicity == "All Races") %>% 
  filter(start_year == max(start_year, na.rm = TRUE)) %>% 
  summarise(total_cases = sum(cases, na.rm = TRUE))
View(data)

cases_2012 <- data <- ages %>% 
  filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>% 
  filter(Cancer_Event_Type == "Mortality") %>% 
  filter(ethnicity == "All Races") %>% 
  filter(start_year == 2012)
View(cases_2012)

cases_2010 <- data <- ages %>% 
  filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>% 
  filter(Cancer_Event_Type == "Mortality") %>% 
  filter(ethnicity == "All Races") %>% 
  filter(start_year == 2010)
View(cases_2010)

#chart
chart <- ggplot(data, aes(x=start_year, y=total_cases)) +
  geom_line()
chart
