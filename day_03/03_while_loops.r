count <- 0

while (count < 10){
  print(count)
  count = count + 1
}


v <- 9  # same thing but using a variable instead of retyping a digit
count <- 0

while (count < v){
  print(count)
  count = count + 1
}


x <- 10
count <- 0
values <- rep(NA, x)

while (count < x){
  print(values)
  count = count + 1
  values[count] <- count
}


x <- 10
i <- 0
values <- rep(NA, x)

while (i < x){
  print(values)
  i = i + 1
  values[i] <- i
}
