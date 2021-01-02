# Uncommment and install packages if you havn't
# install.packages("expm")

library(expm)

# Create our state matrix with transitional probabilities
T <- matrix(c(
  0,0,0.6,0.4,
  0,0,0.6,0.4,
  0,0,0.6,0.4,
  0,0,0.6,0.4
), nrow=4, byrow=TRUE)

# Column Names
colnames(T) <- c(0,1,2,3)

# Row Names
rownames(T) <- c(0,1,2,3)

# Steady state of the transitional matrix
T%^%20

# State 2 is a 60% cahnce from whatever state you are in with a 40% chance of going to state 3
# There is no chance of staying at state 0 or 1 since the requirement from the problem wants
# us to always maintain at least 2 kegs with 60% probability

