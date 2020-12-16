library(tidyverse)
library(lubridate)

# quick datetime info about me
today()

now()

now(tzone='UTC')  # change/pick time zone with tzone

# extract specific values
year(now())

month(now())

day(now())

?month
month(now(), label=TRUE)  # tell me the month
m <- month(now(), label=TRUE, abbr=FALSE)  # tell me the full month (spell it out)


### how to get day of week?
# day(now(), label=TRUE)  # ERROR 
?day

mday(now())

wday(now())
wday(now(), label=TRUE)
wday(now(), label=TRUE, abbr=FALSE)

# other 'day' options
qday(now())

yday(now())


### how to add weekday (e.g. Friday) to day-month-year?
t <- now()

# both these convert day back to number (not label like expected)
cat(wday(t, label=TRUE, abbr=FALSE), ' ', day(t), '-', month(t), '-', year(t))
writeLines(c(wday(t, label=TRUE, abbr=FALSE), ' ', day(t), '-', month(t), '-', year(t)))

# this one works though (with day of week as label)
paste0(wday(t, label=TRUE, abbr=FALSE), ' ', day(t), '-', month(t), '-', year(t))
?paste
