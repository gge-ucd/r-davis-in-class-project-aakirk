#Reading in data
surveys <- read.csv('data/portal_data_joined.csv')
##surveys has been stored as an object

#inspecting the data
#identify how many rows are in the dataset
nrow(surveys)
#identify how many columns are in the dataset
ncol(surveys)

#what kind of data is surveys?
class(surveys)
## this is a dataframe

#Look at the top or bottom data entries
## look at the top
head(surveys)
##look at the bootom 
tail(surveys)

#can see data itself -- go up into the global environment
#and click on surveys or
View(surveys)

#more about the data- what kind of data is it in each row
#and column? str = structure
str(surveys)
#dollar signs =columns 
#strings = vector of characters

#indexing or using square brackets to subset a certain 
#something out of a vector- same concept here

## inside the brackets it goes [row, column]
#look at the first row and first column 
surveys[1,1]
surveys[1,6]
#extracts a vector
##look at just the column 
surveys[,6]
#maintains the data frame
surveys[6]


#special signs for subsetting 
##colon (:) presents a range
##negative sign (-) subtracts

#include rows 1-6
surveys[1:6]

#subtract a whole set of rows
surveys[-(1-6),]
surveys[-1,]


#subsetting with column name
#output is a data frame
surveys["species_id"]

colnames(surveys)

#output is a vector
surveys[,"species_id"]

##prefered subset
##dollar sign gives all options for a vector
surveys$species_id








###LOADING THE TIDYVERSE
#install.packages('tidyverse')

#load a package into a session (do this each time)
library(tidyverse)

#likes working in a tibble instead of a data frame

surveys_t <-read_csv("data/portal_data_joined.csv")
#this is a tibble
surveys_t
#this is a data frame
surveys

#inspections
class(surveys_t)

#subsetting is a little different
surveys[,1] ##gives us a vector
surveys_t[,1] ##gives us a tibble
