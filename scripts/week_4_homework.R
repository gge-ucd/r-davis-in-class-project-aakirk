library(tidyverse)
#1. Create a tibble named surveys 
#from the portal_data_joined.csv file.
surveys <- read_csv("data/portal_data_joined.csv")

surveys

#2. Subset surveys to keep rows with weight 
#between 30 and 60, and print out the first 6 rows.

surveys %>%
  filter(weight > 30 & weight < 60)
print(head(surveys ,6))

#3.Create a new tibble showing the maximum weight 
#for each species + sex combination and name it 
#biggest_critters. Sort the tibble to take a look 
#at the biggest and smallest species + sex combinations. 
#HINT: it’s easier to calculate max if there are no NAs 
#in the dataframe…

biggest_critters <- surveys %>%
  filter(!is.na(weight)) %>% 
           group_by(species_id,sex)
biggest_critters %>%
  summarize(max_weight = max(weight))

biggest_critters %>% arrange(max_weight)

#could also use 

biggest_critters <- surveys %>%
  filter(!is.na(weight) & !is.na(sex) & !is.na(species)) %>%
  group_by(species, sex) %>%
  summarize(maximum_weight = max(weight))
biggest_critters


#Try to figure out where the NA weights are concentrated 
#in the data- is there a particular species, taxa, plot, 
#or whatever, where there are lots of NA values? 
#There isn’t necessarily a right or wrong answer here, 
#but manipulate surveys a few different ways to explore this.
#Maybe use tally and arrange here.

surveys %>% 
  filter(is.na(hindfoot_length)) %>%
  group_by(species) %>% 
  tally() %>% #get all of the NAs in hindfoot
  arrange(desc(n))

# same as n
surveys %>%
  filter(is.na(hindfoot_length)) %>%
  group_by(species) %>%
  summarize(count = n(), mean = mean(weight, na.rm = T))
#if you use summarize, talley will not be a deadend



#5.  #Take surveys, remove the rows where weight is NA and add 
#a column that contains the average weight of 
#each species+sex combination to the full surveys dataframe.
#Then get rid of all the columns except for species, sex, 
#weight, and your new average weight column. 
#Save this tibble as surveys_avg_weight.


 %>%
  group_by(species_id, sex) %>%
  mutate(avg_weight = mean_weight)) %>%
  select(species_id, sex, weight, avg_weight)

#6. #Take surveys_avg_weight and add a new column called above_average 
#that contains logical values stating whether or not 
#a row’s weight is above average for its species+sex 
#combination (recall the new column we made for this tibble).

surveys_avg_weight <- surveys_avg_weight %>%
  mutate(add_column(above_average = weight > avg_weight))
  
         