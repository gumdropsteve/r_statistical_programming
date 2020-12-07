# read in data from github
deck <- read.csv('https://github.com/gumdropsteve/datasets/raw/master/deck.csv')

# filter by row
deck[2,]

# filter by rows
deck[2:5,]

# filter by row value
deck[deck$value > 2, ]

# filter by column
deck[, 2]

# filter by columns 
deck[, 2:3]

# filter by row value and column
deck[deck$value > 2, 1]

# filter by row value and columns
deck[deck$value > 2, 1:2]
