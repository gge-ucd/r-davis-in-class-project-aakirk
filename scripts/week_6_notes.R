## Data visualization 

library(tidyverse)

surveys <- read_csv('data/portal_data_joined.csv') %>%
  filter(complete.cases(.))#filters on whether each row has
#a complete set of values

#ggplot2 is a plotting package that makes it simple to 
#create complex plots from data in a data frame. It provides 
#a more programmatic interface for specifying what variables 
#to plot, how they are displayed, and general visual 
#properties. Therefore, we only need minimal changes if the 
#underlying data change or if we decide to change from a bar 
#plot to a scatterplot. This helps in creating publication 
#quality plots with minimal amounts of adjustments and 
#tweaking.

#gives you a blank canvas
ggplot(data = surveys)

#mapping asestics
ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length))
# now there are axis titles

#add in the geom (for shape)
ggplot(data = surveys, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point()
# this filled in the dots of data

# save this as an object
base_plot <- ggplot(data = surveys, mapping = aes(x = weight, y =hindfoot_length))

base_plot + geom_point()
#adding plot elements: transparency= alpha, color = color, 
#infill = fill

base_plot + geom_point(alpha= 0.2 )# this is pretty transparent

base_plot + geom_point(color = "blue")

base_plot + geom_point(alpha = 0.5, color = "red")

#color by categorical 
ggplot(data =surveys, mapping = aes(x = weight, y = hindfoot_length)) +
  geom_point(mapping = aes(color = species_id)) #use the species id column 
#to assign a color (assigned a different color to each different species id)
#and a key to identify which ones

##GEOM_BOXPLOT
ggplot(data = surveys, mapping = aes(x=species_id, y = weight)) + 
  geom_boxplot()

base_plot2 <- ggplot(data = surveys, mapping = aes(x = species_id, y = 
               weight))


base_plot2 + geom_boxplot(color = 'purple') +
  geom_point()

base_plot2 + geom_boxplot() + geom_jitter()#spreads the points out a 
#bit so they are not all concentrated on the line

base_plot2 + geom_boxplot() + geom_jitter(alpha= 0.2, 
                                          mapping = aes(color = species_id))





##DATA MANIPULATION PT 2##

surveys_complete <- read_csv('data/portal_data_joined.csv') %>%
  filter(complete.cases(.))

yearly_counts <- surveys_complete %>%
  count(year, species_id)

str(yearly_counts)

ggplot(data = yearly_counts, 
       mapping = aes(x = year, y = n, )) 
+ geom_line()#we didn't tell R to group; this looks bad

ggplot(data = yearly_counts, 
       mapping = aes(x = year, y = n, group = species_id )) + geom_line()


ggplot(data = yearly_counts, 
       mapping = aes(x = year, y = n, group = species_id )) +
  geom_line() + facet_wrap(~ species_id) + theme_bw()

ggplot(data = yearly_counts, 
       mapping = aes(x = year, y = n, group = species_id )) +
  geom_line() + facet_wrap(~species)#error

#setting themes

facet_wrap(~ species_id) + 
  theme(plot.background = element_rect(fill = "red"))

library(ggthemes)
