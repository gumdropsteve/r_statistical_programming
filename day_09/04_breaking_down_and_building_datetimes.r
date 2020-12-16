library(tidyverse)
library(lubridate)

today()
now()


### STOCK EXAMPLE
link <- 'https://github.com/gumdropsteve/datasets/raw/master/stocks/TSLA.csv'
df <- read_csv(link)
df <- as_tibble(df)
df

# extract specific values from columns
day(df$ds)
month(df$ds)
year(df$ds)

wday(df$ds, label=TRUE, abbr=FALSE)

# see last 5 and first 5 rows
tail(year(df$ds))
head(year(df$ds))


### TAXI EXAMPLE
link <- 'https://github.com/gumdropsteve/datasets/raw/master/nyc_transport/taxi/yellow_tripdata_2019-01.csv'
df <- read.csv(link)
df <- as_tibble(df)
df

pickup_times <- df$tpep_pickup_datetime

# break down
days <- day(pickup_times)
months <- month(pickup_times)
years <- year(pickup_times)

hours <- hour(pickup_times)
minutes <- minute(pickup_times)
seconds <- second(pickup_times)

# build
# ymd(str_c(years[1], months[1], days[1], collapse=TRUE))  # ERROR
?ymd
ymd(20191204)  # works if switch 4 -> 04

str_c(years[1], months[1], paste0(0, days[1]), collapse=TRUE)  # 4 -> 04 with paste0()

ymd(str_c(years[1], months[1], paste0(0, days[1]), collapse=TRUE))
