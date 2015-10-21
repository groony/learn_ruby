require './task2_5'

class JellyBean < Dessert

  attr_accessor :flavor

  NOT_DELICIOUS = 'black licorice'

  def delicious?
    self.flavor.to_s != NOT_DELICIOUS
  end
end