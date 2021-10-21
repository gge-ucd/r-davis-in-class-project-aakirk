library(tidyverse)
surveys <- read.csv("data/portal_data_joined.csv")
str(surveys)

#this pulls out hindfoot length and summarizes it
summary(surveys$hindfoot_length)

?ifelse
#what do you want R to do if yes, what do you want it to do 
#if it is no? (yes, no)
ifelse(surveys$hindfoot_length <mean(surveys$hindfoot_length,na.rm = T), "small", "big")

ifelse(surveys$hindfoot_length,(surveys$hindfoot_length,na.rm = T)
(surveys <-mutate(surveys, hindfoot_size) = ifelse(surveys$hindfoot_length<mean(surveys$hindfoot_length,na.rm = T), 'small', 'big')


       