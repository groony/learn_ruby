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