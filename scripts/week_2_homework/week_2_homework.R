set.seed(15)
hw2 <- runif(50, 4, 50)
hw2 <- replace(hw2, c(4,12,22,27), NA)
hw2

hw2



"prob1" <- na.omit(hw2)

"prob1" <- prob1[prob1 >14 & prob1 <38]

prob1

prob1 * 3 <- times3

"times3" <- c(prob1 * 3)
times3

"plus10" <- c(times3 + 10)
plus10

"prob3" <- plus10[c(TRUE, FALSE)] 

prob3
