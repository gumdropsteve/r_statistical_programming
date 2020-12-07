# create a 10 die and a 20 sided die
die_10 <- 1:10
die_20 <- 1:20

# create a function to roll 7 of these dice and calculate the sum (use for loop)
roll_7 <- function (die){
  total <- 0
  for(i in 1:7) {
    dice <- sample(die, 1, replace=TRUE)
    total = total + sum(dice)
  }
  print(total)
}

# create a function to calculate how many were > 7 or > 17 (use if statement)
roll_7_count <- function (die, value){
  total <- 0
  count <- 0
  for(i in 1:7) {
    dice <- sample(die, 1, replace=TRUE)
    total = total + sum(dice)
    if (dice > value) count = count + 1
  }
  print(total)
  print(count)
}

# run 
roll_7_count(die_10, 7)
roll_7_count(die_20, 17)
