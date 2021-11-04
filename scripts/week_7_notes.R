library(tidyverse)
data(mtcars)

str(mtcars)

library(ggthemes)

g1 = ggplot(data = mtcars, aes(x = mpg,y = hp)) + geom_point()
g2 = ggplot(data = mtcars, aes(x = mpg,y = hp)) + geom_point() + 
  theme_tufte()
g1
g2

library(gridExtra)
grid.arrange(g1, g2, ncol = 2)#arranging data in 2 columns; figures show up together

ggplot(data = mtcars, aes(x = mpg, y = hp, color = as.factor(cyl))) + geom_point() +
  scale_color_viridis_c(option="B")

library(tigris)
ca_counties = tigris :: countries (state = "GA", class = sf, year = 2017)

install.packages("BrailleR")

barplot <- ggplot(diamonds, aes(x = clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  scale_fill_viridis_d(option = "C") +
  theme_classic()

VI(barplot)

library(ggplot2)
ggplot(diamonds, aes(x = clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  scale_fill_viridis_d(option = "C") +
  theme_classic()
