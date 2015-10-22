class WrongNumberOfPlayersError < StandardError; end

class NoSuchStrategyError < StandardError; end

WIN_COMBINATIONS = [:R_S, :S_P, :P_R]

def rps_game_winner(game)
  combination = [game[0][1].upcase, game[1][1].upcase].join('_').to_sym
  fail WrongNumberOfPlayersError unless game.length == 2
  fail NoSuchStrategyError if game.any? { |i| !%w('R', 'P', 'S').include? i[1] }
  return game[0] if game[0][1] == game[1][1]
  WIN_COMBINATIONS.include?(combination) ? game[0] : game[1]
end
