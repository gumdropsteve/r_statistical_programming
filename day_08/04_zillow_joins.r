library(tidyverse)

# properties data csv
link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/properties_2016_part_0.csv'
p_16 <- read.csv(link)
p_16 <- as_tibble(p_16)
View(p_16)

# training data csv
link <- 'https://github.com/gumdropsteve/datasets/raw/master/zillow/train_2016_v2.csv'
t_16 <- read.csv(link)
t_16 <- as_tibble(t_16)
View(t_16)


# inner_join(): includes all rows in x and y. (both lines do the same thing)

inner_join(p_16, t_16, by='parcelid')

p_16 %>% inner_join(t_16, by='parcelid')


# left_join(): includes all rows in x. (both lines do the same thing)

left_join(p_16, t_16, by='parcelid')

p_16 %>% left_join(t_16, by='parcelid')


# right_join(): includes all rows in y. (both lines do the same thing)

right_join(p_16, t_16, by='parcelid')

p_16 %>% right_join(t_16, by='parcelid')


# full_join(): includes all rows in x or y. (both lines do the same thing)

full_join(p_16, t_16, by='parcelid')

p_16 %>% full_join(t_16, by='parcelid')


# inner join with simple transformation (all 3 lines do the same thing)

inner_join(select(t_16, parcelid, transactiondate), p_16, by='parcelid')

select(t_16, parcelid, transactiondate) %>% inner_join(p_16, by='parcelid')

t_16 %>% select(parcelid, transactiondate) %>% inner_join(p_16, by='parcelid')
