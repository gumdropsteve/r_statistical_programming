# Uncomment if you havn't already installed the package
# install.packages("lpSolve")
library(lpSolve)

?lp

# Objective function coefficients
obj_coeff <- c(13,23,30)

# Constraint coefficients
constraints <- matrix(c(5,15,10,
                        4,4,4,
                        35,20,15,
                        5,10,20), nrow = 4, byrow = TRUE)

# Direction of logical operators
direction <- c("<=", 
               "<=",
               "<=",
               "<=")

# Resources (Right hand side constraints)
resources <- c(480,
               160,
               1190,
               200)

# Create the lp
sol<-lp(
  "max", 
  obj_coeff, 
  constraints, 
  direction, 
  resources,
  compute.sens = TRUE)

# Max Profit
sol$objval

# Best values for objective function
sol$solution