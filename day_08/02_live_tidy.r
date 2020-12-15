# https://r4ds.had.co.nz/tidy-data.html
library(tidyverse)

# tidying when a column names are values of variables

View(table4a)
View(tidy4a)

View(table4a %>% pivot_longer(c(`1999`, `2000`), names_to="year", values_to="cases"))

tidy4a <- table4a %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "cases")
tidy4a



View(table4b %>% pivot_longer(c(`1999`, `2000`), names_to="year", values_to="population"))



tidy4b <- table4b %>% 
  pivot_longer(c(`1999`, `2000`), names_to = "year", values_to = "population")
tidy4b

left_join(tidy4a, tidy4b)


# tidying when observations are accross multiple rows

table2
View(table2)
table2 %>% pivot_wider(names_from=type, values_from=count)
?pivot_wider  # check after seeing

# tidying when multiple variables in the same row 

table3
table3 %>% separate(rate, into=c("cases", "population"), sep="/")
?separate
