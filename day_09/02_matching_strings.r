library(tidyverse)

# str_view() views the matching characters
# str_match() returns the matching characters (or NA if no match)
# str_detect() returns TRUE/FALSE based on match/no match

x <- c("red", "blue", "green")
x

### basic matches

# show me the es
str_view(x, "e")  # note: just highlights the 1st instance

# include 1 character to the left
str_view(x, '.e')

# include 1 character to the left and right
str_view(x, '.e.')  # note, this takes 'blue' out of play

# include 1 character to the left and 2 to the right
str_view(x, '..e..')  # note, this takes 'red' out of play


### anchors

# ^ to match the start of the string
str_view(x, '^r')

str_view(x, '^e')  # note: doesn't match red, blue, or green

# $ to match the end of the string
str_view(x, '..e$')


### direct matches 

x <- c("red", "blue", "green")

# determine if a character vector matches a pattern with str_detect()
str_detect(x, "e$")

str_detect(x, "d")

# extract matched groups from a string
str_match(x, 'e')

str_match(x, '..')

str_match(x, '..e$')
