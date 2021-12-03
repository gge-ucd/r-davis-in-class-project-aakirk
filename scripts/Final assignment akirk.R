library(tidyverse)
library(lubridate)
library(gapminder)

flights <- read_csv("/Users/ashly/OneDrive/Desktop/R_Davis_2021/r-davis-in-class-project-aakirk/data/nyc_13_flights_small.csv")

planes <- read_csv("/Users/ashly/OneDrive/Desktop/R_Davis_2021/r-davis-in-class-project-aakirk/data/nyc_13_planes.csv")

weather <- read_csv("/Users/ashly/OneDrive/Desktop/R_Davis_2021/r-davis-in-class-project-aakirk/data/nyc_13_weather.csv")

summary(flights)

fp_joined <- full_join(flights, planes, by = "tailnum", keep = T) %>%
  mutate(mdh = c(month + day + hour))

weather2 <- weather %>%
  mutate(mdh = c(month + day + hour))

fpw_joined <- full_join(fp_joined, weather2, keep = T )
#take out the "by = " to avoid exponentially increasing the data
#we didn't actually need to mutate to get a common collumn name
#fp_joined we joined by a common column but if we take out 
#by= then it just takes the weather for a certain month,day,orgin and weather 
#at that time

head(fpw_joined)

#Things to Include

#1. Plot the departure delay of flights against the precipitation, and include a 
#simple regression line as part of the plot. Hint: there is a geom_ that will 
#plot a simple y ~ x regression line for you, but you might have to use an argument 
#to make sure it’s a regular linear model. Use ggsave to save your ggplot objects 
#into a new folder you create called “plots”.


#2. Create a figure that has date on the x axis and each day’s mean departure 
#delay on the y axis. Plot only months September through December. Somehow 
#distinguish between airline carriers (the method is up to you). Again, save your 
#final product into the “plot” folder.


#3. Create a dataframe with these columns: date (year, month and day), mean_temp,
#where each row represents the airport, based on airport code. Save this is a 
#new csv into you data folder called mean_temp_by_origin.csv.

#4. Make a function that can: (1) convert hours to minutes; and (2) convert 
#minutes to hours (i.e., it’s going to require some sort of conditional setting 
#in the function that determines which direction the conversion is going). Use 
#this function to convert departure delay (currently in minutes) to hours and 
#then generate a boxplot of departure delay times by carrier. Save this function 
#into a script called “customFunctions.R” in your scripts/code folder.

#R only knows what you tell it! You need to tell H to treat something like 
#an hour or a minute. Take a step back and ask what have I told it.

h_to_m <- function(h){
  m <- (h*60)
  return(m)
}

h_to_m(1)

m_to_h <- function(m){
  h <- (m/60)
  return(h)
}

m_to_h(60)

#we need to make sure the function can have multiple inputs and 
#tell R that if its an hour, then do this-- if it is a minute, do this. 

#Below is the plot we generated from the new data in Q4. (Base code: ggplot(df, 
#aes(x = dep_delay_hrs, y = carrier, fill = carrier)) +   geom_boxplot()).
#The goal is to visualize delays by carrier. Do (at least) 5 things to improve 
#this plot by changing, adding, or subtracting to this plot. The sky’s the limit
#here, remember we often reduce data to more succinctly communicate things.