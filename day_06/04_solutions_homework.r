install.packages("ggplot2")
library(tidyverse)
library(ggplot2)

###############################
########## 3.2.4 ##############
###############################

#1 Run ggplot(data = mpg). What do you see?
# Shows nothing
ggplot(data=mpg)

#2 How many rows are in mpg? How many columns?
dim(mpg)

# There are 234 rows and 11 columns

#3 What does the drv variable describe? Read the help for ?mpg to find out.

# Show data dictionary
?mpg
# drv - the type of drive train, where f = front-wheel drive, r = rear wheel drive, 4 = 4wd

#4 Make a scatterplot of hwy vs cyl.
ggplot(data=mpg) +
  geom_point(mapping = aes(x=hwy, y=cyl))

#5 What happens if you make a scatterplot of class vs drv? Why is the plot not useful?
ggplot(data=mpg) +
  geom_point(mapping = aes(x=class, y=drv))

# This plot only shows that different classes of car can have different drives but does not show which vehicles has which drive

###############################
########## 3.3.1 ##############
###############################

#1. What’s gone wrong with this code? Why are the points not blue?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color = "blue"))

# The points are not blue because the color parameter was included in the aes arguments
# Fixed
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy), color = "blue")

#2 Which variables in mpg are categorical? Which variables are continuous? (Hint: type ?mpg to read the documentation for the dataset). How can you see this information when you run mpg?

# This information can be found underneath the column labels
mpg

# or this can be used
str(mpg)

#3 Map a continuous variable to color, size, and shape. How do these aesthetics behave differently for categorical vs. continuous variables?

# Continuous variable
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=hwy, size=hwy))

# size - The data point is enlarged based on how large the value is when compared to the entire sample
# shape - A continuous variable can not be mapped to shape
# color - The color is represented as a gradient light colors being associated with a larger value

# Categorical Values: 
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=class, size=class, shape=class))

# size - The size of discrete variables is hard to discern on the plot
# shape - The shape palette can deal with a maximum of 6 discrete values because more than 6 becomes difficult to discriminate
# color - Each discrete value is represented as a different color

#4 What happens if you map the same variable to multiple aesthetics?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=class, size=class))

# The aesthetics mapping will return an error if teh data type of the value is not permitted (e.g. shape=continuous var), otherwise it will try to implement the mapping on the desired variable

#5 What does the stroke aesthetic do? What shapes does it work with? (Hint: use ?geom_point)
# Follow Hint
?geom_point

# Find docs here
vignette("ggplot2-specs")

# The size of the filled part is controlled by size, the size of the stroke is controlled by stroke. Each is measured in mm, and the total size of the point is the sum of the two. Note that the size is constant along the diagonal in the following figure.
sizes <- expand.grid(size = (0:3) * 2, stroke = (0:3) * 2)
ggplot(sizes, aes(size, stroke, size = size, stroke = stroke)) + 
  geom_abline(slope = -1, intercept = 6, colour = "white", size = 6) + 
  geom_point(shape = 21, fill = "red") +
  scale_size_identity()

#6 What happens if you map an aesthetic to something other than a variable name, like aes(colour = displ < 5)? Note, you’ll also need to specify x and y.
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy, color=displ<5))
# This creates a threshold where the color will change based on the condition bring passed

###############################
########## 3.5.1 ##############
###############################

#1. What happens if you facet on a continuous variable?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(~ cty)

# It will create too many facets based on every continuous value seen in the sample

#2 What do the empty cells in plot with facet_grid(drv ~ cyl) mean? How do they relate to this plot?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_grid(drv ~ cyl)
# The empty cells represent that there were no vehicles with the faceted vales (drv ~ cyl)

#3 What plots does the following code make? What does . do?
ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(drv ~ .)

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) +
  facet_grid(. ~ cyl)

# "." Lets you choose whether you want to facet in the rows or columns dimmension

#4 Take the first faceted plot in this section: What are the advantages to using faceting instead of the colour aesthetic? What are the disadvantages? How might the balance change if you had a larger dataset?

ggplot(data = mpg) + 
  geom_point(mapping = aes(x = displ, y = hwy)) + 
  facet_wrap(~ class, nrow = 2)

# Faceting in this situation makes it easier to discern between classes versus having all points on a single plot binned by different colors
# The disadvantage is you have to look at multiple plots when in some cases it may be beneficial to plot both classes on a single plot

#5 Read ?facet_wrap. What does nrow do? What does ncol do? What other options control the layout of the individual panels? Why doesn’t facet_grid() have nrow and ncol arguments?
?facet_wrap

#nrow - number of rows
#ncol - number of columns
#scales - Should scales be fixed ("fixed", the default), free ("free"), or free in one dimension ("free_x", "free_y")?

# The rows and cols of facet_grid are determined by the variables passed into the method and not by the user.

#6 When using facet_grid() you should usually put the variable with more unique levels in the columns. Why?
# Most screens are oriented rectangularly so by putting a variable with more unique classes in the columns section will help maximize screen real estate.

###############################
########## 3.6.1 ##############
###############################

#1. What geom would you use to draw a line chart? A boxplot? A histogram? An area chart?
# line chart - geom_line, geom_step, geom_path
# boxplot - geom_boxplot
# histogram - geom_histogram
# area chart - geom_area

#2 Run this code in your head and predict what the output will look like. Then, run the code in R and check your predictions.
ggplot(data = mpg, mapping = aes(x = displ, y = hwy, color = drv)) + 
  geom_point() + 
  geom_smooth(se = FALSE)

#3 What does show.legend = FALSE do? What happens if you remove it? Why do you think I used it earlier in the chapter?
# It removes the legend from the chart
# It was used earlier in the chapter because the legend could add confusion to the plot since some lines were the same color.

#4 What does the se argument to geom_smooth() do?
?geom_smooth
# Display confidence interval around smooth, (TRUE by default, see level to control.)

#5 Will these two graphs look different? Why/why not?
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_point() + 
  geom_smooth()

ggplot() + 
  geom_point(data = mpg, mapping = aes(x = displ, y = hwy)) + 
  geom_smooth(data = mpg, mapping = aes(x = displ, y = hwy))

# They look the same, the only difference is where the arguments are passed

#6 Recreate the R code necessary to generate the following graphs.
ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(se = F)

ggplot(mpg, aes(displ, hwy)) +
  geom_point() +
  geom_smooth(aes(group = drv), se = F)

ggplot(mpg, aes(displ, hwy, colour = drv)) +
  geom_smooth(se = F) +
  geom_point()
ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = drv)) +
  geom_smooth(se = F)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(colour = drv)) +
  geom_smooth(aes(linetype = drv), se = F)

ggplot(mpg, aes(displ, hwy)) +
  geom_point(aes(fill = drv), shape = 21, stroke = 2, colour = "white", size = 3)

###############################
########## 3.7.1 ##############
###############################

# 1. What is the default geom associated with stat_summary()? How could you rewrite the previous plot to use that geom function instead of the stat function?
?stat_summary
# Default geom is pointrange
ggplot(data = diamonds) +
  geom_pointrange(
    mapping = aes(x = cut, y = depth),
    stat = "summary",
    fun.min = min,
    fun.max = max,
    fun = median)

#2 What does geom_col() do? How is it different to geom_bar()?
?geom_col

# There are two types of bar charts: geom_bar() and geom_col(). geom_bar() makes the height of the bar proportional to the number of cases in each group (or if the weight aesthetic is supplied, the sum of the weights). If you want the heights of the bars to represent values in the data, use geom_col() instead. geom_bar() uses stat_count() by default: it counts the number of cases at each x position. geom_col() uses stat_identity(): it leaves the data as is.

#3 Most geoms and stats come in pairs that are almost always used in concert. Read through the documentation and make a list of all the pairs. What do they have in common?
# You can see the pairs under the "Stats" section https://ggplot2.tidyverse.org/reference/

#4 What variables does stat_smooth() compute? What parameters control its behaviour?
?stat_smooth
# Aids the eye in seeing patterns in the presence of overplotting. geom_smooth() and stat_smooth() are effectively aliases: they both use the same arguments. Use stat_smooth() if you want to display the results with a non-standard geom.

#5 In our proportion bar chart, we need to set group = 1. Why? In other words what is the problem with these two graphs?
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, y = after_stat(prop)))
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop)))

# The group aesthetic is by default set to the interaction of all discrete variables in the plot. This choice often partitions the data correctly, but when it does not, or when no discrete variable is used in the plot, you will need to explicitly define the grouping structure by mapping group to a variable that has a different value for each group.
ggplot(data = diamonds) + 
  geom_bar(mapping = aes(x = cut, fill = color, y = after_stat(prop), group=1))

# Each cut group is treated as separate group that sums to 1, by specifying group=1 you put all cut groups in the same group when proportions are calculated

###############################
########## 3.8.1 ##############
###############################

#1. What is the problem with this plot? How could you improve it?
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point()

# There are a lot of overlapping points and jitter can help with this overplotting problem

#2. What parameters to geom_jitter() control the amount of jittering?
?geom_jitter
# Width and Height
ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point() +
  geom_jitter(width = 3, height = 4)

#3 Compare and contrast geom_jitter() with geom_count().
?geom_jitter
?geom_count

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point() +
  geom_jitter()

ggplot(data = mpg, mapping = aes(x = cty, y = hwy)) + 
  geom_point() +
  geom_count()

# One adds jitter to plots the other counts how many points are overlapping.

#4. What’s the default position adjustment for geom_boxplot()? Create a visualisation of the mpg dataset that demonstrates it.
ggplot(data = mpg, mapping = aes(x = class, y = displ)) + 
  geom_boxplot(aes(colour = drv))
