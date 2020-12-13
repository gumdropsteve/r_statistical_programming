library(tidyverse)

# load in mpg data
df <- mpg

# make a plot
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy))

# add color (by class)
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, color=class))

# add a size (by class)
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, size=class))

# do color (by class) and size (by class)
ggplot(data=mpg) +
  geom_point(mapping = aes(x=displ, y=hwy, color=class, size=class))
