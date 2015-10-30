class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

# probably a better way to do this with comparable and define a scheme for R, P, S
def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2
  @first_player = game[0];
  @second_player = game[1];
  
  raise NoSuchStrategyError unless (@first_player[1] =~ /\A[RPS]\z/i) and (@second_player[1] =~ /\A[RPS]\z/i)
  # if the first and second player chose the same move, the first player wins
  if @first_player[1] == @second_player[1]
    @winner = @first_player;
    # if the first and second player choose different moves... who wins?
  else
    # if the first player chooses rock
    if @first_player[1].upcase == 'R'
      # second player wins if he chooses paper
      if @second_player[1].upcase == 'P'
        @winner = @second_player
      # second player loses if he chooses scissors
      else
        @winner = @first_player
      end
    # if the first player chooses paper
    elsif @first_player[1].upcase == 'P'
      # second player loses if he chooses rock
      if @second_player[1].upcase == 'R'
        @winner = @first_player
      # second player wins if he chooses scissors
      else
        @winner = @second_player
      end
    # if the first player chooses scissors
    else
      # second player loses if he chooses paper
      if @second_player[1].upcase == 'P'
        @winner = @first_player
      # second player wins if he chooses rock
      else
        @winner = @second_player
      end
    end
  end
  # return the winner
  return @winner;
end

def rps_tournament_winner(player_list)
  @round_winners = []    # place to hold the winners for each round

  # stopping conditon
  if player_list.size == 1
    # return the winning player
    return player_list[0]
  else
    # chop out the first two people from the list
    player_list.flatten.each_slice(4) do |player1_name, player1_move, player2_name, player2_move|
      # add the winner of the game to the round winners
      @round_winners << rps_game_winner([[player1_name, player1_move],[player2_name, player2_move]])
    end
    # recursion to figure out the next round from the list of winners
    rps_tournament_winner(@round_winners)
  end
end

puts rps_game_winner([ [ "John", "r" ], [ "Mary", "s" ] ])