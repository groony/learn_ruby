class WrongNumberOfPlayersError < StandardError ; end

class NoSuchStrategyError < StandardError ; end

WIN_COMBINATIONS = [:R_S,:S_P,:P_R]

def rps_game_winner(game)
  valid_strategies = ['R','P','S']
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless valid_strategies.include? game[0][1].upcase
  raise NoSuchStrategyError unless valid_strategies.include? game[1][1].upcase
  return game[0] if game[0][1] == game[1][1]
  (WIN_COMBINATIONS.include?(([game[0][1].upcase, game[1][1].upcase].join('_')).to_sym)) ? game[0] : game[1]
end