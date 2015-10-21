class Dessert

  attr_accessor :name
  attr_accessor :calories

  def initialize(name, calories)
    self.name = name
    self.calories = calories
  end

  def healthy?
    (self.calories.to_i < 200)
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert

  attr_accessor :flavor

  NOT_DELICIOUS = 'black licorice'

  def delicious?
    self.flavor.to_s != NOT_DELICIOUS
  end
end