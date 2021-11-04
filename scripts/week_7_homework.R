#libary(tidyverse)
#library(ggthemes)
#getwd()

gapminder <- read_csv("https://gge-ucd.github.io/R-DAVIS/data/gapminder.csv")


##1. To get the population difference between 2002 and 2007 for each country, it would probably be easiest to have a country in each row and a column for 2002 population and a column for 2007 population.
gapminder %>%
  filter(year %in% c(2002, 2007))

#or you could do it like this:
gapminder %>%
  filter(year == 2002| year == 2007 | year ==2012)

gapminder %>% filter(year %in% c(2002))
gapminder %>% filter(year == 2002)
gapminder %>% filter(country == c('Nepal','Afghanistan')) #this doesnt work 
#because the vector is Nepal and Afghanistan and recycles (skipping all the false 
#or if there is one or the other)
#it through the data-- %in% searches through everything

gapminder %>% filter(year %in% c(2002,2007)) %>%
  pivot_wider(id_cols = country,names_from = year,values_from = pop) %>%
  mutate(popDiff = `2007`-`2002`)

new_data = gapminder %>% filter(year %in% c(2002,2007)) %>%
  pivot_wider(id_cols = c(country,continent),names_from = year,values_from = pop) %>%
  mutate(popDiff = `2007`-`2002`) %>%#use these carrot things-- so you don't do math with things that arent numbers
  filter(continent!='Oceania') 

ggplot(new_data) + facet_wrap(~continent) +
  geom_bar(aes(x = country,y = popDiff))


ggplot(new_data) + geom_bar(aes(x = continent))

ggplot(data =new_data) + facet_wrap(~continent) +
  geom_bar(aes(x = reorder(country,popDiff),y = popDiff),stat = 'identity') #tells R not to do anything with stat but what we tell it

ggplot(data =new_data) + facet_wrap(~continent,scales = 'free') +
  geom_bar(aes(x = reorder(country,popDiff),y = popDiff),stat = 'identity') +
  labs(x = 'Country',y = 'change in pop. 2002 to 2007') + 
  theme_bw() +
  theme(axis.text.x = element_text(colour = 'red',angle = 45)) +
  coord_flip()



##2. Notice the order of countries within each facet. You’ll have to look up how to order them in this way.


##3. Also look at how the axes are different for each facet. Try looking through ?facet_wrap to see if you can figure this one out.

##4. The color scale is different from the default- feel free to try out other color scales, just don’t use the defaults!
  
##5. The theme here is different from the default in a few ways, again, feel free to play around with other non-default themes.

##6. The axis labels are rotated! Here’s a hint: angle = 45, hjust = 1. It’s up to you (and Google) to figure out where this code goes!
  
##7. Is there a legend on this plot?