require './task2_5'

# JellyBean
class JellyBean < Dessert
  attr_accessor :flavor

  NOT_DELICIOUS = 'black licorice'

  def delicious?
    flavor.to_s != NOT_DELICIOUS
  end
end
