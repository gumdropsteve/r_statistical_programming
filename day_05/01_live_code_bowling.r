# set number of pins
n_pins <- 10

# how many rounds are in a game?
n_rounds <- 10

# how many palyers are playing?
n_players <- 2

# how many bowling ball throws does each player get per round?
n_bowls <- 2

bonus <- 0

# how many points does this player have this game?
players_game_score <- 0

# how many games are we playing?
n_games <- 20

# record of who won each game
game_winners <- rep(0, n_games)
game_winning_scores <- rep(0, n_games)
  
# play each game
for (g in 1:n_games){
  
  # reset the high score because it's a new game
  this_games_high_score <- 0
  
  # each player 
  for (p in 1:n_players){
    # for each round in this game
    for (n in 1:n_rounds){
      # do each throw
      for (throws in 1:n_bowls){
        # check if this is the 1st throw
        if (throws == 1){
          # knock down some pins
          n_pins_out <- sample(n_pins, 1)
          # calculate how many pins are still standing
          n_pins_left <- n_pins - n_pins_out
        } 
        # it is not the 1st throw
        else {
          # are there any pins left?
          if (n_pins_left > 0){
            # yes, so bowl again
            n_pins_out_2 <- sample(n_pins_left, 1)
          }
          else {
            # there are no pins remaining, add a bonus for getting a strike
            bonus <- 1
          }
        }
      }
      # did the player bowl 2 times?
      if (bonus == 0){
        this_players_score <- n_pins_out + n_pins_out_2
      } else {
        this_players_score <- n_pins_out + bonus
      }
      # add this round's score to the player's game score
      players_game_score <- players_game_score + this_players_score
      # clear this player's stats so the next round can start clean
      n_pins_out <- 0
      n_pins_out_2 <- 0
      bonus <- 0
    }
    # did the player score more than the game's high score?
    if (this_players_score > this_games_high_score){
      # set this player's score as the game's high score
      this_games_high_score <- this_players_score
      game_winning_scores[g] <- this_games_high_score
      # remember the player who scored it
      game_winners[g] <- p
    } 
    # check if there was a tie
    else if (this_players_score == this_games_high_score){
      # there was a tie, record it as no winner
      game_winners[g] <- 0
    }
  }
}

game_winners
game_winning_scores

winners_table <- table(game_winners)
winners_table

hist(game_winners)
hist(game_winning_scores)
