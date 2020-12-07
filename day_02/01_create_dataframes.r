# create dataframe from scratch
df <- data.frame(Month = c('Jan', "Feb", 'March'), 
                 Revenue = c(21, 18, 19),
                 Costs = c(7, 7, 7))

df


# create dataframe from scratch (note: can be named whatever you want)
whatever <- data.frame(Month = c('Jan', "Feb", 'March'), 
                       Revenue = c(21, 18, 19),
                       Costs = c(7, 7, 7))

whatever


# create dataframe from csv file on github (url to raw file)
df = read.csv('https://raw.githubusercontent.com/gumdropsteve/datasets/master/views.csv')

df


# create dataframe from csv file on github (other url format, switch /blob/ for /raw/)
df <- read.csv('https://github.com/gumdropsteve/datasets/raw/master/views.csv')

df
