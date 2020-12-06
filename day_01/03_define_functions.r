roll <- function(die, p){
  dice <- sample(die, 2, replace=TRUE, prob=p)
  dice
}

die <- 1:6
p <- c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)

roll(die, p)
