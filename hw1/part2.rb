class WrongNumberOfPlayersError < StandardError ; end
class NoSuchStrategyError < StandardError ; end

def rps_result(m1, m2)
  # YOUR CODE HERE
  raise NoSuchStrategyError unless m1[1] =~ /^(r|p|s){1}$/i && m2[1] =~ /^(r|p|s){1}$/i
  result = case
    when m1[1].downcase == 'r' && m2[1].downcase == 's' then m1
    when m1[1].downcase == 'p' && m2[1].downcase == 'r' then m1
    when m1[1].downcase == 's' && m2[1].downcase == 'p' then m1
    when m1[1].downcase == m2[1].downcase then m1
    else m2
  end
end

def rps_game_winner(game)
  # YOUR CODE HERE
  raise WrongNumberOfPlayersError unless game.length == 2
  rps_result(game[0], game[1])
end

def rps_tournament_winner(tournament)
  # YOUR CODE HERE
  if tournament[0][0].class == String
    return rps_result(tournament[0], tournament[1])
  else
    tournament = [].push(rps_tournament_winner(tournament[0])).push(rps_tournament_winner(tournament[1]))
    return rps_tournament_winner(tournament)
  end
end
