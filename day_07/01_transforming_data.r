library(tidyverse)

link <- 'https://github.com/gumdropsteve/datasets/raw/master/december_real_estate.csv'
df <- read.csv(link)


# view dataset tidy (note the difference with how these display in console)
df
as_tibble(df)

df <- as_tibble(df)

# view like excel or github
View(df)


# filter function
filter(df, closing_price > 1000000)

filter(df, client == 'seller')

filter(df, client != 'seller', commission > 10000)

filter(df, ds > '12/14/2019')

filter(df, ds <= '12/14/2019', realtor_id == 0)

filter(df, client == 'seller', ds == '12/14/2019', realtor_id == 0)

filter(df, 
       realtor_id == 3,
       location == 'pleasanton')


# arrange function
arrange(df, ds)

arrange(df, desc(ds))

arrange(df, closing_price)

arrange(df, desc(closing_price))


# select function
select(df, ds)

select(df, ds, closing_price)


# mutate function 
mutate()


# summarise function
summarise()


# group by function
group_by()
