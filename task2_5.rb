class Dessert

  def initialize(name, calories)
    @name = name
    @calories = calories
  end

  def getName
    @name
  end

  def setName(name)
    @name = name
  end

  def getCalories
    @calories
  end

  def setCalories(calories)
    @calories = calories
  end

  def healthy?
    (@calories < 200)
  end

  def delicious?
    true
  end
end