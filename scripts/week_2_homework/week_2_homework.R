
set.seed(15)
?set.seed
#random number generator
hw2 <- runif(50, 4, 50)
#normal distribution
hw2 <- replace(hw2, c(4,12,22,27), NA)
# this is so the same NAs are put in for everyones screen
hw2

hw2[hw2!=NA]
hw2[hw2!= 'NA']
#remove the NAs 
hw2

hw2[is.na(hw2)]
# Just the Nas-- 
#! makes it so it is the opposite
hw2[!is.na(hw2)]


"prob1" <- hw2[!is.na(hw2)]

"prob1" <- prob1[prob1 >= 14 & prob1 <=38]

prob1

#to times every number by 3
prob1 * 3 <- times3

"times3" <- c(prob1 * 3)
times3

#every number plus 10 in the times 3 vector
"plus10" <- c(times3 + 10)
plus10

#take the plus10 vector and get every other number 
"prob3" <- plus10[c(TRUE, FALSE)] 
##this is vector recycling where it will keep taking true and 
##and false vectors 

## another way to do it--
?seq
odds <- seq(from =1, to =23, by =2)

odds
final <-plus10[odds]

final

#making code "better" aka soft coding

seq(from = 1, to =length(plus10), by =2)
#or this means the same thing
seq(1, 23,2)


