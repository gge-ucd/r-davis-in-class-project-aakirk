#open the data and data subdirectory
surveys <- read.csv("data/portal_data_joined.csv") #reading the data in 

#open the packages that the scipt requires
library(tidyverse)

#create a new data frame called surveys base
surveys_base <- select(surveys, species_id, weight, plot_type)
str(surveys_base)

#or this is another way to get those results in 'base r"
surveys_base <- surveys[c('species_id', 'weight', 'plot_type')]
str(surveys_base)

# using piping %>%
surveys_base <- surveys %>% select(species_id, weight, plot_type)
str(surveys_base)

?select

#have the data frame only be the first 60 rows
surveys_base <- head(surveys_base, 60)
str(surveys_base)

#using base r
surveys_base <- surveys_base[1:60,]
str(surveys_base)

surveys_base<- surveys[c(1:60),c(6, 9, 13)]#caution depending on the indexing
surveys_base %>% str()
#instead of selecting these certain numbers 6, 9, 13, better way
#to manage these in case you add a column-- call by column names

#convert both species_id and plot type to factors
surveys_base$species_id<- as.factor(surveys_base$species_id)
class(surveys_base$species_id)

#Explore these variables and try to explain why a factor is different from a character.
#Remove all rows where there is an NA in the weight column.
surveys_base_nonas <- na.omit(surveys_base)
str(surveys_base_nonas)
#problem because this omits all NAs from the dataset

#another way to do it:
surveys_base_nonas <- na.omit(surveys_base$weight)
str(surveys_base_nonas)#we took what was a vector but 
#didn't know you had a data frame #if you put in a data frame 
#in you get a data frame out, if you put a vector in
#you get a vector out

#identify where NAs are
is.na(surveys_base$weight)
#using trues and false are important to return what you want
#reverse it so it is what we want to return 
!is.na(surveys_base$weight)

surveys_base %>% na.omit(surveys_base$weight)
na.omit(surveys_base, surveys_base$weight)#take the surveys 
#base dataframe and return all of the values are weight

#index something 
surveys_base[is.na(surveys_base$weight),] #to return all columns
surveys_base[!is.na(surveys_base$weight),]#end up with all that 
#all the values are not NA


#CHALLENGE: Create a second data frame called challenge_base that 
#only consists of individuals from your surveys_base data frame 
#with weights greater than 150g.
challenge_base <- surveys_base[which(surveys_base$weight<150),]
#what is which doing? 
summary(challenge_base$weight)

surveys_base$weight >150
which(surveys_base$weight)

colnames(surveys) #a list of the column names 

select(.data = species_id, weight, plot_type)

surveys_new <- surveys[1:60, c(6, 9, 13)] #selecting rows 1:60 and 
#just columns 6, 9, and 13

surveys_new$species_id <- as.character(surveys_new$species_id)

surveys_new$plot_type <- as.character(surveys_new$plot_type)
