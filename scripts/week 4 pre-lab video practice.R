library(tidyverse)


surveys <-read_csv('data/portal_data_joined.csv')
#dimensions - tells how many rows and columns
dim(surveys)

#select grabs particular columns from the data frame
select(surveys,)

#get column names
str(surveys)

#select function will know that everything you write after is
#a column name
select(.data = surveys, sex, weight, genus)
# we find out that there is 34,000 of these- lets nest it in 
#the head function
head(select(surveys, sex, weight, genus))

#the filter function grabs specific rows-- but provide R with 
##some rules to sort against
## can use to pull all of the observations from a specific 
#time period
## or all of the data that the sex = female

filter(surveys,genus=='neotoma')
# add a conditional statement/logical statement that = that vaule or doesnt
#need the specific character name in quotations
head(filter(surveys,genus=='Neotoma'))

#return any row that the genus is not Neotoma
head(filter(surveys,genus!='Neotoma'))

surveys2 <- filter(surveys, genus != "Neotoma")
surveys3 <- select(surveys2, genus, sex, species)

str(surveys3)

#filter the surveys object for cases that the genus is not neotoma
surveys_filtered <- select(filter(surveys, genus != 'Neotoma'),genus, sex, species)
 
#verify that it worked 
identical(surveys3, surveys_filtered)

#special character that strings select and filter together
#%>%
  
surveys_filtered_again <- surveys %>% 
  filter(genus!='Neotoma') %>% select(genus, sex, species)




##Mutate function allows you to create a new column or alter an existing 
#column in a dataset
surveys %>% mutate(weight_kg = weight/1000) %>%head()

#when you use mutate it is not saved; no wieght column present in 
str(surveys)

#how to save it as a column
surveys <- surveys %>% mutate(weight_kg = weight/1000) %>%head()
str(surveys)

#another way to do it 
mutate(surveys, weight_kg = weight/1000)



#--- Data Manipulation part 2 video
#group by and summarize 

surveys <- read.csv('data/portal_data_joined.csv')

str(surveys)
#interested in grouping by something and then summarizing that

#pipe
surveys %>% group_by(sex)
surveys %>% group_by(genus)

surveys %>% group_by(sex) %>% summarize(weight)
#saying we want to summarize weight and group by sex- doesn't
#work- why? we havent given it a function to sort by

surveys %>% group_by(sex) %>% summarize(mean(weight,na.rm = T))

#we can name this column
surveys %>% group_by(sex) %>% 
  summarize(avg_weight = mean(weight,na.rm = T))

#we can add another median weight column
surveys %>% group_by(sex) %>% 
  summarize(avg_weight = mean(weight,na.rm = T),med_weight = median(weight, na.rm = T))

#Tally tells us how many are there of each of these things- 
#how many observations are in each category
surveys %>% group_by(sex) %>% tally()
