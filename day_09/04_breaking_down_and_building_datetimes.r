library(tidyverse)
library(lubridate)

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
?ymd

ymd(20191204)

str_c(years[1], months[1], paste0(0, days[1]), collapse=TRUE)

# ymd(str_c(years[1], months[1], days[1], collapse=TRUE))  # ERROR

ymd(str_c(years[1], months[1], paste0(0, days[1]), collapse=TRUE))
