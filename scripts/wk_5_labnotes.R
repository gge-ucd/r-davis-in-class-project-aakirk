library(tidyverse)
##conditional statements to specify values

#if something is true, do this arguement and if its false 
#do this agrument


surveys %>%
  filter(!is.na(weight)) %>% # get rid of NAs
  mutate(weight_cat = case_when(weight > mean(weight) ~ "big",
                                weight < mean(weight) ~ "small")) %>% # assign column values
  select(weight, weight_cat) %>% # select just take make our viewing better
  tail() # look at the bottom 6

## Using the iris data frame (this is built in to R), 
#
create a new variable 
#that categorizes petal length into three groups:
#small (less than or equal to the 1st quartile)
#medium (between the 1st and 3rd quartiles)
#large (greater than or equal to the 3rd quartile)
#Hint: Explore the iris data using 
#summary(iris$Petal.Length), to see the petal 
#length distribution. Then use your function of choice: 
#ifelse() or case_when() to #make a new variable named 
#petal.length.cat based on the conditions listed above. 
#Note that in the iris data frame there are no NAs, 
#so we don’t have to deal with #them here.

data(iris)
head(iris)
str(iris)
summary(iris$Petal.Length)

iris_summary <- iris %>%
  mutate(length_cat = case_when(Petal.Length <=1.600 ~ "small",
         Petal.Length >1.600 & Petal.Length <5.1 ~ "medium",
         Petal.Length >=5.1 ~"large"))

#using the if.else
iris %>%
  mutate(length_cat = ifelse(Petal.Length <= 1.6, "small",
                             ifelse(Petal.Length >= 5.1, "large",
                                    "medium")))
   ## if the first statement is true, small, then go to 
#nested. if nested is true, go to large and if still not 
#true, go to medium

##second part of class
##joinging datasets

#looks at 2 dataframes and looks for common columns 
#join left, join right, joint full, join inter
#you can specify what coloumns you'd like to join
#left join would keep left and match similar things on the right
#interjoin keeps common column and only returns those same columns
#full joins everything

surveys = read_csv("data/portal_data_joined.csv")
tail_length = read_csv("data/tail_length.csv")

str(tail_length)
str(surveys)

#this tells what these datasets have in common
intersect(colnames (surveys), colnames(tail_length))

combo_dataframe = left_join(surveys,tail_length)

str(combo_dataframe)


##part 3. Pivot function
#Use pivot_wider on the surveys data frame with year as columns, 
#plot_id as rows, and the number of genera per
#plot as the values. You will need to summarize 
#before reshaping, and use the function n_distinct() 
#to get the number of unique genera within a particular 
#chunk of data. It’s a powerful function! 
#See ?n_distinct for more.

combo_dataframe = left_join(surveys,tail_length)
str(combo_dataframe)

temp_df = surveys %>% group_by(year,plot_id) %>% tally()

str(temp_df)


pivot_wider(temp_df)
pivot_wider(temp_df,names_from = 'year',values_from = 'n')

pivot_wider(data = surveys,id_cols = c('plot_id'),
            names_from = year,values_fn = n)
?pivot_wider




surveys %>% group_by(year,plot_id) %>% tally()
#incorrect attempt
surveys_wider <- pivot_wider(data = surveys,id_cols = )

str(surveys_wider)

#n_distinct
?n_distinct
surveys %>% group_by(plot_id,year) %>% summarize(distinct_genus = n_distinct(genus))
