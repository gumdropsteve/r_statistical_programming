# loop version
long_version <- function(vec){
  for (i in 1:length(vec)){
    if(vec[i] < 0){
      vec[i] <- -vec[i]
    }
  }
  vec
}


# vectorized version
vec_version <- function(vec){
  vec[vec < 0] <- -vec[vec <= 0]
}


# make some data
long_data <- rep(c(-1, 1), 7000000)
long_data
sum(long_data)  # should sum to 0 (-1 + 1 = 0)


# time the functions
system.time(long_version(long_data))
system.time(vec_version(long_data))
