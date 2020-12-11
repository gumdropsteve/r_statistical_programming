# Potential Questions to Answer:
# 1. Create snacks that the customers can buy and randomize who buys which snack
# 2. Pretend you own multiple theaters and run two simulations to represent each theater and plot the results
# 3. Create conditional statements for movies that may be PG-13 and children are not allowed to watch

# set ticket prices for adults and children
ticket_cost <- 12
ticket_cost_child <- 8

# set up snacks, snack prices, and odds any customer purchases each
snacks <- c(NA, 'popcorn','small_candy', 'big_candy')
snack_prices <- c(0, 9.75, 4.25, 7)
snack_odds <- c(0.5, 0.34, 0.05, 0.11)

# list 5 of your favorite movies or shows
movies <- c('Public Enemies', 
            'Free to Choose', 
            'The Psychological Significance of the Biblical Stories', 
            'Soft White Underbelly', 
            'Scarface')

# how many screens does the theater have? (assume 1 per movie)
screens <- length(movies)

# how many seats does each screen have?
seats <- 50 

# make a record book to store total revenue for each day
week_days <- rep(0, 7)

# iterate through each day of the week
for (day in 1:length(week_days)) {
  
  # keep track of total revenue for this day
  this_days_revenue <- 0
  
  # iterate through the each of your screens for this day
  for (s in 1:screens) {
    
    # calculate how many adults and how many children are watching this screen
    visitors_adults <- sample(seats, 1)
    visitors_children <- sample((seats - visitors_adults), 1)
    
    # calculate this screen's revenue for adults, and for children
    revenue_adults <- visitors_adults * ticket_cost
    revenue_children <- visitors_children * ticket_cost_child
    # calculate snacks revenue for this screen
    total_visitors <- visitors_adults + visitors_children
    revenue_snacks <- sample(snack_prices, 
                             total_visitors, 
                             replace=TRUE,
                             prob=snack_odds)
    
    # calculate this screen's total revenue, and add to running total for the day
    this_screens_ticket_revenue <- revenue_adults + revenue_children
    this_screens_revenue_for_today <- this_screens_ticket_revenue + revenue_snacks
    this_days_revenue <- this_days_revenue + this_screens_revenue_for_today
  }
  # write today's total revenue at it's index in the record book
  week_days[day] <- this_days_revenue
}

# make a barchart showing total revenue per day
barplot(week_days,  # <- what's being plotted
        main = "Total Movie Revenue Per Day",  # chart title
        xlab = "Day of Week",  # x axis label
        ylab = "Revenue (USD)",  # y axis label
        names.arg = c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"),  # add day labels
        col = "lightblue",  # adjust color
        density = 20,  # adjust how filled in each bar is
)

# make any other chart
plot(week_days)  # simple scatter plot

# which day had the highest revenue?
index_of_max_value <- which.max(week_days)  # <- asks, which index has the max value?
days_of_the_week <- c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat")
days_of_the_week[index_of_max_value]
