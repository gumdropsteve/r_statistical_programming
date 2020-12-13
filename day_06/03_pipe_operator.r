library(tidyverse)

View(diamonds)

# the pipe operator
diamonds$x %>%
  mean()

mean(diamonds$x)

diamonds$x %>%
  round(1) %>%
  mean()

sum(diamonds$x)

diamonds$x %>%
  round(1) %>%
  sum()

library(tidyverse)

View(diamonds)

# the pipe operator
diamonds$x %>%
  mean()

mean(diamonds$x)

diamonds$x %>%
  round(1) %>%
  mean()

floor(diamonds$x)

diamonds$x %>%
  subset(diamonds$x > 5) %>%
  floor()
  

# for more: https://www.datacamp.com/community/tutorials/pipe-r-tutorial
