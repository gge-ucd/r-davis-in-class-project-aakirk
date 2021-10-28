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


###IN CLASS
#Challenge
#Use what you just learned to create a scatter plot of 
#weight and species_id with weight on the Y-axis, and 
#species_id on the X-axis. Have the colors be coded by 
#plot_type. Is this a good way to show this type of data?
#What might be a better graph?

surveys_complete <- surveys %>%
  filter(complete.cases(.))

plot <- ggplot(data = surveys_complete, mapping = aes(y = weight, x = species_id)) +
  geom_point(alpha = 0.5, aes(color = plot_type))

# switches axes
ggplot(data = surveys_complete,
       mapping = aes(y = weight, x = plot_type)) +
  geom_point(alpha = 0.5, aes(color = species_id))

# plot types as panels
ggplot(surveys_complete, aes(x = species_id, y = weight)) +
  geom_point() +
  facet_wrap(~plot_type)

# don't like the theme
ggplot(surveys_complete, aes(x = species_id, y = weight)) +
  geom_point() +
  theme_classic()

ggplot(surveys_complete, aes(x = species_id, y = weight)) +
  geom_boxplot() +
  geom_jitter(mapping = aes(color = plot_type))


#Challenges
#Boxplots are useful summaries, but hide the shape of the 
#distribution. For example, if the distribution is bimodal, 
#we would not see it in a boxplot. An alternative to the 
#boxplot is the violin plot, where the shape (of the density
#of points) is drawn.
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_boxplot(alpha = 0) +
  geom_jitter(alpha = 0.3, color = "tomato") #notice our color needs to be in quotations 

#1. ##Replace the box plot with a violin plot; see 
#geom_violin().
# adding violin
ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
  geom_jitter(alpha = 0.1, color = "tomato") +
  geom_violin(alpha = 0)

# adding
base <- ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight))

base +
  geom_jitter(alpha = .1) +
  geom_violin() +
  scale_y_log10()


#In many types of data, it is important to consider the 
#scale of the observations. For example, it may be worth 
#changing the scale of the axis to better distribute the 
#observations in the space of the plot. Changing the scale 
#of the axes is done similarly to adding/modifying other 
#components (i.e., by incrementally adding commands). 
#Try making these modifications:
  #2. #Represent weight on the log10 scale; see scale_y_log10().

scale_plot <- ggplot(data = surveys_complete, mapping = aes(y = weight, x = species_id)) + 
  geom_violin(aes(color = species_id)) + 
  scale_y_log10('weight')

scale_plot

#Make a new plot to explore the distrubtion of 
#hindfoot_length just for species NL and PF. 

surveys_complete %>%
  #inclusive is & vs. "or"
  filter(species_id == "NL" | species_id =="PF") %>%
  ggplot(mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.5) + 
  geom_jitter(alpha = 0.3, mapping = aes(color = plot_id))

# plot is is numeric but want it to be categorical

hindfoot_survey <- surveys_complete %>%
  # inclusive is & vs "or" |
  filter(species_id == "NL" | species_id == "PF")

hindfoot_survey$plot_factor <- as.factor(hindfoot_survey$plot_id)

ggplot(data = hindfoot_survey,
       mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = plot_factor))

ggplot(data = hindfoot_survey,
       mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = plot_factor))


surveys_complete %>%
  # inclusive is & vs "or" |
  filter(species_id == "NL" | species_id == "PF") %>%
  mutate(plot_factor = as.factor(plot_id)) %>%
  ggplot(mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = plot_factor))



#Overlay a jitter plot of the hindfoot lengths of 
#each species by a boxplot. Then, color the datapoints 
#according to the plot from which the sample was taken.
##Hint: Check the class for plot_id. Consider changing 
#the class of plot_id from integer to factor. Why does 
#this change how R makes the graph?   


#change the axis titles 
surveys_complete %>%
  # inclusive is & vs "or" |
  filter(species_id == "NL" | species_id == "PF") %>%
  ggplot(mapping = aes(x = species_id, y = hindfoot_length)) +
  geom_boxplot(alpha = 0.1) +
  geom_jitter(alpha = 0.3, mapping = aes(color = as.factor(plot_id))) +
#labels funtion 
  labs(x = "Species ID", y = "Hindfoot Length", title = "Boxplot", 
     color = "Plot ID") + 
  theme_classic() + theme(axis.title.x = element_text(angle = 45))
