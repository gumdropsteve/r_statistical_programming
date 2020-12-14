library(tidyverse)

link <- 'https://github.com/gumdropsteve/datasets/raw/master/december_real_estate.csv'
df <- read.csv(link)


# view dataset tidy (note the difference with how these display in console)
df
as_tibble(df)

df <- as_tibble(df)

# view like excel or github
View(df)



### filter function

# single filter
filter(df, closing_price > 1000000)

filter(df, client == 'seller')

filter(df, ds > '12/14/2019')

# multiple filters
filter(df, client != 'seller', commission > 10000)

filter(df, ds <= '12/14/2019', realtor_id == 0)

filter(df, client == 'seller', ds == '12/14/2019', realtor_id == 0)

filter(df, 
       realtor_id == 3,
       location == 'pleasanton')



### arrange function

# order by single column
arrange(df, ds)

arrange(df, closing_price)

# descending order by single column
arrange(df, desc(ds))

# order by multiple columns
arrange(df, ds, realtor_id)

arrange(df, ds, realtor_id, closing_price)

# descending order by multiple columns
arrange(df, desc(realtor_id), desc(closing_price))

# mixed order by multiple columns
arrange(df, desc(realtor_id), desc(commission), location)



### select function

# select a single column
select(df, ds)

# select multiple columns
select(df, ds, closing_price)

select(df, realtor_id, closing_price, ds)

# select all columns, but put one (realtor_id in our case) first (most left)
select(df, realtor_id, everything())

select(df, realtor_id, commission, everything())

# keep results around as a variable
r_df <- select(df, ds, client, realtor_id, everything())
View(r_df)



### mutate function
df_small <- select(df, ds, client, realtor_id, closing_price, commission_rate)
df_small

# create (add) a single new column
mutate(df_small,
       commission = closing_price * commission_rate)

# create (add) multiple new columns
mutate(df_small,
       commission = closing_price * commission_rate,
       was_listing_agent = client == 'seller')


### transmute function 

# create a single column (drop all others)
transmute(df_small,
          commission = closing_price * commission_rate)

# create multiple columns (drop all others)
transmute(df_small,
          commission = closing_price * commission_rate,
          was_listing_agent = client == 'seller')

# create multiple columns (keep a few original around as well, drop all others)
transmute(df_small,
          ds,
          closing_price,
          commission = closing_price * commission_rate,
          was_listing_agent = client == 'seller')


### summarize function
summarize(df, mean(closing_price))

# best when used with group by
by_id <- group_by(df, realtor_id)
summarize(by_id, count = n())

summarize(by_id, 
          count = n(), 
          avg_closing_price = mean(closing_price),
          avg_commission = mean(commission),
          gross_commission = sum(commission))

s_df <- summarize(by_id, count=n(), avg_closing_price=mean(closing_price),
          avg_commission=mean(commission), gross_commission=sum(commission))

filter(s_df, count > 5)
