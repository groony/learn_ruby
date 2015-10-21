class WrongNumberOfPlayersError < StandardError ; end

class NoSuchStrategyError < StandardError ; end


def rps_result(m1, m2)
  p1 = m1[1].upcase
  p2 = m2[1].upcase

  case p1
  when 'R'
    case p2
    when 'S'
      m1
    when 'R'
      m1
    when 'P'
      m2
    end
  when 'S'
    case p2
    when 'S'
      m1
    when 'R'
      m2
    when 'P'
      m1
    end
  when 'P'
    case p2
    when 'S'
      m2
    when 'R'
      m1
    when 'P'
      m1
    end
  end
end

def rps_game_winner(game)
  valid_strategies = ['R','P','S']
  raise WrongNumberOfPlayersError unless game.length == 2
  raise NoSuchStrategyError unless valid_strategies.include? game[0][1].upcase
  raise NoSuchStrategyError unless valid_strategies.include? game[1][1].upcase
  rps_result(game[0],game[1])
end