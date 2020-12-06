# install.packages('ggplot2')

library(ggplot2)

roll <- function(die, p){
  dice <- sample(die, 2, replace=TRUE, prob=p)
  dice
}

die <- 1:6
probability <- c(1/6, 1/6, 1/6, 1/6, 1/6, 1/6)

rolls <- replicate(1000000, roll(die, probability))
                   
qplot(rolls)
