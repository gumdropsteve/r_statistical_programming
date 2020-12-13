Run this R script to get started with tidyverse...
```r
install.packages("tidyverse")

library(tidyverse)

ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, color=class))
```
