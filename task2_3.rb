class WrongNumberOfPlayersError < StandardError; end

class NoSuchStrategyError < StandardError; end

COMBOS = %w(S R), %w(P S), %w(R P)
def rps_game_winner(arr)
  fail WrongNumberOfPlayersError unless arr.length == 2
  fail NoSuchStrategyError if arr.any? { |i| !%w(R P S).include? i[1] }

  arr[COMBOS.include?(arr.map(&:last)) ? 1 : 0]
end
