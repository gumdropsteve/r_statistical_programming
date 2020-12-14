library(tidyverse)

link <- 'https://github.com/gumdropsteve/datasets/raw/master/sample_yellow_tripdata_2019-01.csv'
df <- read.csv(link)
df <- as_tibble(df)

ggplot(data=df) +
  geom_bar(mapping=aes(x=passenger_count))

ggplot(data=filter(df, trip_distance < 20)) +
  geom_bar(mapping=aes(x=trip_distance))

ggplot(data=df) +
  geom_point(mapping=aes(x=passenger_count, 
                         y=trip_distance))
