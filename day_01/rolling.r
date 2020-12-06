# create a 10 die and a 20 sided die
die10 <- 1:10
die20 <- 1:20

# create a function to roll 6 of these dice and calculate the sum
roll6 <- function (die){
  total <- 0
  for(i in 1:6) {
    dice<-sample(die, 1, replace=TRUE)
    total = total + sum(dice)
  }
  print(total)
}

# create a function to calculate how many were > 6 or > 16
roll6_count <- function (die, sixer){
  total <- 0
  count <- 0
  for(i in 1:6) {
    dice<-sample(die, 1, replace=TRUE)
    total = total + sum(dice)
    if (dice > sixer) count=count+1
  }
  print(total)
  print(count)
}
roll6_count(die10,6)
roll6_count(die20,16)
