library(cowplot)
library(tidyverse)

summary(diamonds)

# make a few plots:
plot.diamonds <- ggplot(diamonds, aes(clarity, fill = cut)) + 
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5))
#plot.diamonds

plot.cars <- ggplot(mpg, aes(x = cty, y = hwy, 
  colour = factor(cyl))) + geom_point(size = 2.5)
#plot.cars

plot.iris <- ggplot(data=iris, aes(x=Sepal.Length, 
  y=Petal.Length, fill=Species)) +
  geom_point(size=3, alpha=0.7, shape=21)
#plot.iris

#intall cowplot install packages ("cowplot")

# use plot_grid
panel_plot <- plot_grid(plot.cars, plot.iris, plot.diamonds, 
labels=c("A", "B", "C"), ncol=2, nrow = 2)

panel_plot

#use ggdraw + draw_plot to line up the plots
ggdraw() + draw_plot(diamonds.plot, x = 0, y = 0, width = 1, height = 0.5) +
#x and y start at 0 and width takes up whole axis and y takes half
  draw_plot(mpg.plot, x = 0, y = 0.5, height, 0.5, width = 0.5) +
  draw_plot(diamonds.plot, x = 0.5, y = 0.5, width = 0.5, height = 0.5)

#ggsave saves plots and you need to specify the file
#getwd
#ggsave("finalplot.png")

##in class
library(tidyverse)


library(ggplot2)
myplot = ggplot(diamonds, aes(x = clarity, fill = cut)) +
  geom_bar() +
  theme(axis.text.x = element_text(angle=70, vjust=0.5)) +
  scale_fill_viridis_d(option = "C") +
  theme_classic()
library(BrailleR)
VI(myplot)

library(sonify)

