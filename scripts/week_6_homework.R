library(tidyverse)

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")

nrow(gapminder)
ncol(gapminder)
summary(gapminder)


###1. calculate the mean life expectancy on each continent 
#Then create a plot that shows how life expectancy has changed 
#over time in each continent. Try to do this all in one step 
#using pipes! (aka, try not to create intermediate dataframes)

life_expectancy_changed <- gapminder %>% 
  group_by(continent, year)%>%
  summarise(mean_lifeExp = mean(lifeExp)) %>%
ggplot()+
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))+ #scatter plot
  geom_line(aes(x = year, y = mean_lifeExp, color = continent)) #line plot

##ANSWER KEY
gapminder %>%
  group_by(continent, year) %>% 
  summarize(mean_lifeExp = mean(lifeExp)) %>% #calculating the mean life expectancy for each continent and year
  ggplot()+
  geom_point(aes(x = year, y = mean_lifeExp, color = continent))+ #scatter plot
  geom_line(aes(x = year, y = mean_lifeExp, color = continent)) #line plot
###2. Look at the following code and answer the following 
#questions. What do you think the scale_x_log10() line 
#of code is achieving? What about the geom_smooth() line 
#of code?

#ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
    theme_bw()

#Challenge! Modify the above code to size the points 
#in proportion to the population of the country. 
#Hint: Are you translating data to a visual feature of 
#the plot?
#ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
ggplot(gapminder, aes(x = gdpPercap, y = lifeExp)) +
  geom_point(aes(color = continent, size = pop)) + 
  scale_x_log10() +
  geom_smooth(method = 'lm', color = 'black', linetype = 'dashed') +
  theme_bw()

###3. Create a boxplot that shows the life expectency for 
#Brazil, China, El Salvador, Niger, and the United States, 
#with the data points in the backgroud using geom_jitter. 
#Label the X and Y axis with “Country” and “Life Expectancy” 
#and title the plot “Life Expectancy of Five Countries”.

countries <- c('Brazil', 'China', 'El Salvador', 'Niger', 'United States')

gapminder %>%
  filter(country %in% countries) %>%
  ggplot(aes(x=country, y=lifeExp)) + 
  geom_boxplot() + 
  geom_jitter(alpha=0.3, color = "red" + theme_classic()) + 
  ggtitle("Life Expectancy in 5 Countries") +
  theme(plot.title = element_text(hjust = 0.5)) +
  xlab("country") + ylab("life expectancy")
         
         