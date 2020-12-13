# Potential Questions to Answer:
# 1. Create snacks that the customers can buy and randomize who buys which snack
# 2. Pretend you own multiple theaters and run two simulations to represent each theater and plot the results

# set ticket prices for adults and children
default_ticket_cost <- 12
default_ticket_cost_child <- 8

# set up snacks, snack prices, and odds any customer purchases each
snacks <- c(NA, 'popcorn','small_candy', 'big_candy')
snack_prices <- c(0, 9.75, 4.25, 7.25)
snack_odds <- c(0.5, 0.34, 0.05, 0.11)

# list 5 of your favorite movies or shows
movies <- c('Public Enemies', 
            'Free to Choose', 
            'The Psychological Significance of the Biblical Stories', 
            'Soft White Underbelly', 
            'Scarface')

# how many screens does the theater have? (assume 1 per movie)
default_screens <- length(movies)

# how many seats does each screen have?
default_seats <- 50 

# make a record book to store total revenue for each day
week_days <- rep(0, 7)

  
theater_sim <- function(screens=default_screens,  # how many screens?
                        seats=default_seats,  # how many seats per screen?
                        ticket_cost=default_ticket_cost,  # adult ticket price
                        ticket_cost_child=default_ticket_cost_child  # child ticket price
                        ){
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
      
      # find snack choices (represented by their index value) for everyone watching
      total_visitors <- visitors_adults + visitors_children
      snack_choice_indexes <- sample(1:length(snacks),
                                     total_visitors, 
                                     replace=TRUE,
                                     prob=snack_odds)
      # use the snack choice indexes to find which snack & the sum of their prices
      snack_choices <- snacks[snack_choice_indexes]  
      revenue_snacks <- sum(snack_prices[snack_choice_indexes])
  
      # calculate this screen's total revenue, and add to running total for the day
      this_screens_ticket_revenue <- revenue_adults + revenue_children
      this_screens_revenue_for_today <- this_screens_ticket_revenue + revenue_snacks
      this_days_revenue <- this_days_revenue + this_screens_revenue_for_today
    }
    # write today's total revenue at it's index in the record book
    week_days[day] <- this_days_revenue
  }
  week_days
}


# simulate 2 movie theaters for 1 week
theater_01 <- theater_sim()
theater_02 <- theater_sim(seats=75, 
                          screens=3)
theater_03 <- theater_sim(ticket_cost=18,
                          ticket_cost_child=5)

# make a barchart showing total revenue per day
barplot(theater_01,  # <- what's being plotted
        main = "Theater #1 - Total Movie Revenue Per Day",  # chart title
        xlab = "Day of Week",  # x axis label
        ylab = "Revenue (USD)",  # y axis label
        names.arg = c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"),  # add day labels
        col = "lightblue",  # adjust color
        density = 20,  # adjust how filled in each bar is
)

barplot(theater_02,  # <- what's being plotted
        main = "Theater #2 - Total Movie Revenue Per Day",  # chart title
        xlab = "Day of Week",  # x axis label
        ylab = "Revenue (USD)",  # y axis label
        names.arg = c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"),  # add day labels
        col = "lightblue",  # adjust color
        density = 20,  # adjust how filled in each bar is
)

barplot(theater_03,  # <- what's being plotted
        main = "Theater #3 - Total Movie Revenue Per Day",  # chart title
        xlab = "Day of Week",  # x axis label
        ylab = "Revenue (USD)",  # y axis label
        names.arg = c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat"),  # add day labels
        col = "lightblue",  # adjust color
        density = 20,  # adjust how filled in each bar is
)

# (function) which day had the highest revenue?
find_best_day <- function(theater){
  index_of_max_value <- which.max(theater)  # <- asks, which index has the max value?
  days_of_the_week <- c("Sun", "Mon", "Tues", "Wed", "Thurs", "Fri", "Sat")
  best_day <- days_of_the_week[index_of_max_value]
  best_day
}

# share each theater's best day
paste('Theater #1 best day was', find_best_day(theater_01), 'with', paste0('$', max(theater_01)))
paste('Theater #2 best day was', find_best_day(theater_02), 'with', paste0('$', max(theater_02)))
paste('Theater #3 best day was', find_best_day(theater_03), 'with', paste0('$', max(theater_03)))
