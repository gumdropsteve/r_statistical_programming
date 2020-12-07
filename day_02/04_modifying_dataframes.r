# read in data from github
deck <- read.csv('https://github.com/gumdropsteve/datasets/raw/master/deck.csv')

# make copy of dataframe named blackjack
blackjack <- deck

facecard <- c('king', 'queen', 'jack')

# focus rows where face column value is in facecard
blackjack[blackjack$face %in% facecard, ]

# focus value column rows where that row's face column value is in facecard
blackjack$value[blackjack$face %in% facecard]

# make a copy of deck dataframe named hearts
deck_2 <- deck

# set all value column values to 0
deck_2$value <- 0

deck_2

# set all value column values where that row's suit value is 'hearts' to 1
deck_2$value[deck_2$suit == "hearts"] <- 1

deck_2

# add new column ('order') to deck_2 dataframe
deck_2$order <- 1:52

deck_2
