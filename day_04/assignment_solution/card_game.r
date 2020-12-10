#Starter code
link <- 'https://github.com/gumdropsteve/datasets/raw/master/deck.csv'
deck <- read.csv(link)
deck

#Create number of rounds and players

n_rounds = 100
n_players = 4

# make result holders
round_leader_points = rep(0, n_rounds)
round_leader_name = rep(0, n_rounds)

# start rounds
for (r in 1:n_rounds){
  
  # shuffle the original deck (needs to be reshuffled every round)
  shuffled_deck <- deck[sample(nrow(deck)),] 
  # print(shuffled_deck)
  
  # how many cards do we need for this round? (3 cards per player)
  n_cards_total <- 3 * n_players
  
  # take the number of cards from the top of the shuffled deck
  cards_in_play = head(shuffled_deck, n_cards_total)
  
  for (p in 1:n_players){
    # print(p)
    
    first_value = (p * 3) - 2
    last_value = p * 3
    
    # deal this player (p) their cards
    this_players_cards = cards_in_play[first_value:last_value, ]
    # print(this_players_cards)
    
    # add the values of the player's cards together (value column)
    this_players_score = sum(this_players_cards$value)
    # print(this_players_score)
    
    # did this player score higher than the current leader?
    if (round_leader_points[r] < this_players_score){
      # yes, so make this player (p) the new leader (of this round (r))
      round_leader_points[r] = this_players_score
      round_leader_name[r] = p
    } 
    # did the player tie the current high score?
    else if (round_leader_points[r] == this_players_score) {
      # yes, so set the round leader to 0 (no winner)
      round_leader_name[r] = 0
      # if a later player scores more than the tie, they will be made the leader by the 1st if ^^
    }
  }
}


# make table of sums of rounds won by each player
leader_table = table(round_leader_name)
leader_table

# plot the table
plot(leader_table)
