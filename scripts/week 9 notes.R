#PART 1 ---WRITING DATES IN R---
sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")
#notice we have dates across two years here

sort(sample_dates_1)
#puts in 'alphabetical order since they are characters
as.Date(sample_dates_1)

#What is the class that R classifies this data as?
   #R classifies our sample_dates_1 data as character data. 
#Let’s transform it into Dates. Notice that our sample_dates_1 
#is in a nice format: YYYY-MM-DD. This is the format necessary 
#for the function as.Date.

sample_dates_1 <- as.Date(sample_dates_1)

sample_dates_1
str(sample_dates_1) #now they are classified as dates


#What happens with different orders…say MM-DD-YYYY?
  # Some sample dates: 
  
  sample_dates_2 <- c("02-01-2018", "03-21-2018", "10-05-2018", "01-01-2019", "02-18-2019")

sample_dates_3 <-as.Date(sample_dates_2) # well that doesn't work
str(sample_dates_3)

# Some sample dates:
sample_dates_2 <- c("02-01-2018", "03-21-2018", "10-05-2018", "01-01-2019", "02-18-2019")

sample_dates_3<- as.Date(sample_dates_2, format = "%m-%d-%Y" ) # date code preceded by "%"

#The nice thing is this method works well with pretty much any format, 
#you just need to provide the associated codes and structure:
  # as.Date("2016/01/01", format="%Y/%m/%d")=2016-01-01
  #as.Date("05A21A2011", format="%mA%dA%Y")=2011-05-21


#Challenge#
#Format this date with the as.Date function: Jul 04, 2019

challenge_date <- c("07-04-2019")
challenge_date2 <- as.Date(challenge_date, format = "%m-%d-%y")
challenge_date2

#using lubridate#
install.packages('lubridate')

sample_dates_1 <- c("2018-02-01", "2018-03-21", "2018-10-05", "2019-01-01", "2019-02-18")

#Lubridate uses functions that looks like ymd or mdy to transform data 
#into the class “Date”. Our sample_dates_1 data is formatted 
#like Year, Month, Day, so we would use the lubridate function 
#ymd (y = year, m = month, d = day).

lubridate::ymd(sample_dates_1)
#you can also reverse that
lubridate::mdy(sample_dates_1)

lubridate::decimal_date(ymd(sample_dates_1))

## Part 2 ---WRITING FUNCTIONS---
##Functions are operations we run in R. usually specified with 
#one or more arguments
?log

#a summing function, with no built in arguments
#Let’s start by defining a simple function to add two numbers.
2+3

#a summing function again, but with default values for arguments

my_sum <- function(number1, number2){
  the_sum <- number1 + number2
  return(the_sum)
}

my_sum(number1 = 10, number2 = 5)
my_sum(10,5) #if you write them in the correct order you do not
#have to specify which is which

#This is the basic structure, which you can read as “assign 
#to the variable my_sum a function that takes arguments a and
#b and returns the_sum.” The body of the function is delimited 
#by the curly-braces. The statements in the body are indented. 
#This makes the code easier to read but does not affect how 
#the code operates.

##a summing function again, but with default values for arguments

my_sum2 <-function(number1 = 5, number2 = 10) {
  the_sum <- number1 + number2
  return(the_sum)
}

my_sum2()
my_sum2(number1 = 10)

##temperature conversion

F_to_K <- function(tempF){
  K <- ((tempF - 32)*(5/9)) + 273.15
  return(K)
}

F_to_K(32)

##CHALLENGE1
#Write a function called K_to_C that takes a temperature in K and 
#returns that temperature in C
#Hint: To convert from K to C you subtract 273.15
#Create a new R script, copy F_to_K and K_to_C in it, and save it as 
#functions.R in the code directory of your project

K_to_C <- function(tempK) {
  C <- ((tempK - 273.15))
  return(C)
}

#try it out
K_to_C(373.15)

##gapminder data set: Average GDP per capita over a range of years
library(tidyverse)
install.packages("gapminder")
library(gapminder)

summary(gapminder)

gapminder %>%
  filter(country == "Canada", year %in% 1970:1980) %>%
           summarise(mean(gdpPercap, na.rm = T))

#can we rewrite this in a function so we can change the country and year range? 
#also-- make arguments different names than existing column names
## we want to switch out the hard code from Canada from 1970-1980 to be soft-coded 
#as any country or year we put in this year 
avgGDP <- function(cntry, yr.range) {
  gapminder %>%
  filter(country == cntry, year %in% yr.range) %>%
    summarise(mean(gdpPercap, na.rm = T))
} 

avgGDP(cntry = "Iran", yr.range = 1985:1990)#character data needs quotations
avgGDP(cntry = "Zambia", yr.range = 1900:2020)

#--CHALLENGE #2--
challenge_2 <- function(cntry2, dat = gapminder) {
  df <- filter(dat, country == cntry2)
  plot <- ggplot(df, aes(year, pop))+
    geom_line()
      return(plot)
}
challenge_2("Zambia")  
