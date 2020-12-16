### string basics (https://r4ds.had.co.nz/strings.html)  ###

string1 <- "This is a string"
string1

string2 <- 'This is a string'
string2

string3 <- 'If I want to include a "quote" inside a string, I use single quotes'
string3

string4 <- "If I want to include a 'quote' inside a string, I use double quotes"
string4

# including a single " or ' in a quote
double_quote <- "\"" # or '"'
writeLines(double_quote)  # https://rdrr.io/r/base/writeLines.html

single_quote <- '\'' # or "'"
writeLines(single_quote)


### special characters

x <- "\u00b5"
x

# \n means new line
x <- 'hey\nhey'
print(x)  # doesn't print seperate lines...? 
writeLines(x)
cat(x)  # https://stackoverflow.com/questions/9317830/r-do-i-need-to-add-explicit-new-line-character-with-print

x <- c('hey', 'hey')
writeLines(x)  # https://stackoverflow.com/a/54817227/11074111


### string length

# for a single string
str_length('this is a string')

# for multiple strings
str_length(c('this is a string', "this is also a string"))

m <- c('this is a string', 
       "this is also a string",
       '"this one too", she said',
       "'and this?")
str_length(m)


### combining strings

str_c("l", "o", 'l')

str_c("This", "is", "a", 'sentence.')

str_c("This", ' ', "is", ' ', "a", ' ', 'sentence.')

str_c("This ", "is ", "a ", 'sentence.')

# use the `sep` argument to control how they’re separated:
str_c("This", "is", "a", 'sentence.', sep=' ')

str_c('a', 'good', 'file', str_c('name', '.csv'), sep='_')


### null values

x <- c("abc", NA)

str_c(x)  # doesn't work with NA (aka 'null') values

# make NA values string
str_replace_na(x)  # output of str_replace_na() is a vector

str_replace_na(x, "xyz")  # replace NA values with 'xyz' string

str_c(str_replace_na(x))  # still outputs vector

str_c("left-", str_replace_na(x), "-right")  # still output vector

# `collapse` arg makes a vector of strings into a single string
str_c(str_c('left-', str_replace_na(x), "-right"), collapse=' ')

# `sep` won't work for vectors, `collapse` will
str_c(c("x", "y", "z"), sep='')
str_c(c("x", "y", "z"), collapse='')


### numbers work too!

str_c(1, 2, 3)

str_c(1, 2, 3, sep='-')

str_c('He', 'said', 'meet', 'at', 2, 'a.m.', sep=' ')

str_c(c(1, 'a', 2, 'b', 3), collapse='')


### str_sub() -- substrings (subsetting strings)

x <- c("Apple", "Banana", "Pear")

# pull the 1st through 3rd characters from each word
str_sub(x, 1, 3)

# negative numbers count backwards from end
str_sub(x, -3, -1)


### adjust strings (Locales)

# str_to_lower() makes the string lowercase
str_to_lower('BIG WORDS')

x <- c('A', 'Big', 'worD', 'HeRe')
str_to_lower(x)

# str_to_upper() makes the string lowercase
str_to_upper('big words')

x <- c('A', 'Big', 'worD', 'HeRe')
str_to_lower(x)

# what if we only want the 1st letter to be upper?
x <- c('a lowercase sentence', 'SENTENCE 2', 'sentence 3')
str_to_sentence(x)

# what if we only want the 1st letter of each word to be upper?
str_to_title(x)
