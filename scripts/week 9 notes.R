
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
