# create a 10 sided die
die_10 <- 1:10

# how many rounds will there be? 
n_rounds <- 100

# how many players will there be?
n_players <- 4

# variable to hold the current round's highest score & the player who scored it
current_round_best_score <- 0
current_round_leader <- NA

# make a null vector to record each round's winner
winners <- rep(NA, n_rounds)

# go through however many rounds there are
for (i in 1:n_rounds){
  # have each player roll
  for (p in 1:n_players){
    # roll & sum the outcome
    outcome <- sample(die_10, 2, replace=FALSE)
    outcome <- sum(outcome)
    
    # check if this player rolled more than the previous leader
    if (outcome > current_round_best_score){
      # replace this round's high score & leader if they've been beaten
      current_round_best_score <- outcome
      current_round_leader <- p
    }
  }
  # record the round's winner
  winners[i] <- current_round_leader
  
  # reset the high score
  current_round_best_score <- 0
  current_round_leader <- NA
}

# create a table of results
results = table(winners)
# results = summary(as.factor(winners))
results
