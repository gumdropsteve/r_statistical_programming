library(tidyverse)

# simple custom data
# https://r4ds.had.co.nz/relational-data.html#understanding-joins

x <- tribble(
  ~key, ~val_x,
  1, "x1",
  2, "x2",
  3, "x3"
)
y <- tribble(
  ~key, ~val_y,
  1, "y1",
  2, "y2",
  4, "y3"
)

x %>% 
  inner_join(y, by = "key")

x %>% 
  left_join(y, by = "key")

x %>% 
  right_join(y, by = "key")

x %>% 
  full_join(y, by = "key")


# zillow kaggle data
# https://github.com/gumdropsteve/datasets/tree/master/zillow

link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/properties_2016_part_0.csv'
p_16 <- read.csv(link)
p_16 <- as_tibble(p_16)
View(p_16)

link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/train_2016_v2.csv'
t_16 <- read.csv(link)
t_16 <- as_tibble(t_16)
View(t_16)

inner_join(p_16, t_16, by='parcelid')
left_join(p_16, t_16, by='parcelid')
right_join(p_16, t_16, by='parcelid')
full_join(p_16, t_16, by='parcelid')
