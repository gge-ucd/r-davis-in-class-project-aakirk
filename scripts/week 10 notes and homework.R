
##WEEK 10##
#-----Iteration
##1. walk through "for loops"
##2. walk through map functions
##3. In Class apply and practice

#----- Remembering square brackets and data types
head(iris)
head(mtcars)

#this returns the first column in list form
iris[1] 

# output first column in a vector form
iris[[1]]

iris$Sepal.Length

#output is first row
iris[,1]
iris[1,1]
iris$Sepal.Length[1]

#----- For loops
for(i in 1:10){
  print(i)
}

#R stores the last value of 10 as i
i

for(i in 1:10){
  print(iris$Sepal.Length[i])
}
#these two return the same values
head(iris$Sepal.Length, n = 10)

for(i in 1:10){
  print(iris$Sepal.Length[i])
  print(mtcars$mpg[i])
}

#store output
#rep means repeat or replicate 
#replicate the NA and the number of times we want out nuber of rows in (mtcars)
results <- rep(NA, nrow(mtcars))
results

#instead of printing we want to store these into a particular place
for(i in 1:nrow(mtcars)){
  results[i] <- mtcars$wt[i]*100
}

results
#these are 100 times the values in mtcars

##----- Map family of functions
##map takes an input and a function argument
library(tidyverse)
head(iris)
#take the mean of each column
map(iris, mean)
#anything after the underscore is the desired output (now its a tibble)
map_df(iris, mean)
#the NA is for species because R doesn't know how to take the mean of characters
map_df(iris[1:4], mean)
#columns 1-4 have continuous data; if you call them the species column is dropped

##mapping with 2 arguments with a pre-written function
mtcars
print_mpg <- function(x,y){
  paste(x, "gets", y, "miles per gallon")
}

map2_chr(rownames(mtcars), mtcars$mpg, print_mpg)
#now we have characters and sentences about mpg for each car

#mapping with 2 arguments with an embedded "anonymous" function
map2_chr(rownames(mtcars), mtcars$mpg, function(x,y) paste(x, "gets", y, "miles per gallon"))
#this gives us the same thing just another way to get there