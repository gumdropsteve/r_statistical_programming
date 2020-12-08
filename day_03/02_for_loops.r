n <- 7

for (i in 1:n){
  print(i)
}

for (i in 1:n){
  print(i / 2)
}


# for loop on indexes
values <- rep(NA, 7)

for (i in 1:n){
  values[i] <- i / 2
}

values

for (v in values){
  print(v)
}


q <- 10  # same thing but using variable instead of retyping digit
values <- rep(NA, q)

for (i in 1:q){
  values[i] <- i / 2
}

values

for (v in values){
  print(v)
}
