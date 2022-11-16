cancer_file <- "https://raw.githubusercontent.com/info201a-au2022/project-group-3-section-aa/main/data/cancer_by_ages.csv"
ages <- read.csv(cancer_file, header = TRUE, stringsAsFactors = FALSE)



#change columns name

colnames(ages)[1] <- "age_group"

colnames(ages)[4] <- "cases"

colnames(ages)[6] <- "population"

colnames(ages)[7] <- "ethnicity"

colnames(ages)[8] <- "frequency"

colnames(ages)[9] <- "gender"



#used data columns

data <- ages %>%
  
  filter(Data_Collection_Starting_Year == max(Data_Collection_Starting_Year)) %>%
  
  filter(Cancer_Organ_Site == "All Cancer Sites Combined") %>%
  
  filter(Cancer_Event_Type == "Mortality")

#View(data)



#get cases for each race

by_races <- data %>%
  
  group_by(ethnicity) %>%
  
  select(ethnicity, cases) %>%
  
  summarise(total_cases = sum(cases, na.rm = TRUE))

#View(by_races)



#get cases for each age groups

by_age_groups <- data %>%
  
  group_by(age_group) %>%
  
  select(age_group, cases) %>%
  
  summarise(total_cases_age_groups = sum(cases, na.rm = TRUE))

#View(by_age_groups) 