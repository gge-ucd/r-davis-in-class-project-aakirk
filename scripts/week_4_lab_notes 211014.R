library(tidyverse)

surveys <- read.csv('data/portal_data_joined.csv')
#1. keep only observations before 1995
surveys_base <- filter(surveys, surveys$year < 1995)
#or this feature in the tidyverse can also tell 
#in the surveys dataframe, find year
filter(surveys, year < 1995)


#2.Keep year, sex, and weight
surveys_base <- select(surveys_base, year, sex, weight)
str(surveys_base)

#how did we combine these
surveys_base <- filter(surveys, year<1995) %>% select(year,sex,weight)
#this is another way to accomplish this
surveys_base <- surveys %>% filter(year<1995) %>% select(year,sex, weight)

#How to nest this function
surveys_base <- filter(select(surveys,year,sex,weight),year<1995)

##Use the mutate function
#changing the values in an existing column, override the column

##Create a new data frame from the surveys data that meets the following criteria:
#1. contains only the species_id column 
#2. and a new column called hindfoot_half containing values that are half the hindfoot_length values.
#3. In this hindfoot_half column, there are no NAs and all values are less than 30.
#Name this data frame surveys_hindfoot_half

surveys_hindfoot_half <- surveys %>% 
  filter(!is.na(hindfoot_length)) %>% 
  mutate(hindfoot_half = hindfoot_length/2) %>% 
  filter(hindfoot_half <30) %>% 
  summary()

#walk through each part
#started with surveys object
#filtered out all nas 
#pipe down to the next line
#create a new column called hindfoot half
#and that is hindfoot/2
#filter out values greater than 30 in hindfoot half

surveys_hindfoot_half <- surveys %>%
  filter(.,!is.na(hindfoot_length)) %>%
  mutate(.,hindfoot_half = hindfoot_length/2) %>%
  select(.,species_id,hindfoot_half) %>%
  filter(.,hindfoot_half < 30)

##Group by and summarize 
#this is a subgroup I want to create in the data frame

#Use group_by() and summarize() to find the mean, min, and max hindfoot length
#for each species (using species_id).

?group_by

surveys %>% filter(.,!is.na(hindfoot_length)) %>%
  group_by(species_id) %>%
  summarize(mean(hindfoot_length),min(hindfoot_length),max(hindfoot_length)) %>%
  head()





