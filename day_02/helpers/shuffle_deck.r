deck <- read.csv('https://github.com/gumdropsteve/datasets/raw/master/deck.csv')

set.seed(42)  # so we get the same 'random' shuffle every time (don't do this IRL unless you have a reason to)

rows <- sample(nrow(deck))

shuffled_deck <- deck[rows, ]

shuffled_deck
