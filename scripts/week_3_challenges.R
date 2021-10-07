
#reading in spreadsheets

read.csv('data/portal_data_joined.csv')
#save this as an object called surveys

surveys <-read.csv('data/portal_data_joined.csv')

#look at the first values in the data
head(surveys)


#class of surveys?
str(surveys)
##data frame

#how to look at fewer rows
head(surveys)#first 6 rows

#summary of the data at a glance
summary(surveys)


#how many rows and how many coloumns? 
nrow(surveys)
ncol(surveys)
 
#how are our character data represented in this data frame?

#how many species have been recorded during these surveys?
surveys$species#shows all species
unique(surveys$species) #shows all unique species
#or use nest fuctions
length(unique(surveys$species))
table(surveys$species)

duplicated(surveys$species)
sum(!duplicated(surveys$species))#reverse unique, so something
#that is not duplicated, then sum it

#levels as a way to identify unique character factors but this
#does not work for just characters
#starting with characters is good
levels(surveys$species)


#subsetting from a data frame
#how is this different?
#need to say row and column -- row 1 and column 2


##Factors
?factor
#converting to a factor
species_factor <- factor(surveys$species)
#it is kind of like a number
typeof(species_factor)
#but also it is a character
class(species_factor)

#levels usually default to alphabetical order
levels(species_factor)

##Challenge subsetting and data frames
surveys200 <- surveys[1:200,1:13]#OR surveys[200,]

surveys200
 #Extract the last row in surveys and name it surveys_last

surveys_last <- surveys[length(tail), 1:13]
surveys_last
#another way to do it but length makes sure it stays the last 
#row as the data changes
surveys[200,]
tail(surveys)

#Use nrow to identify row thats in the middle and name it 
#surveys middle

nrow(surveys)
