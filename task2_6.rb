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
    (@calories.to_i < 200)
  end

  def delicious?
    true
  end
end

class JellyBean < Dessert

  def getFlavor
    @flavor
  end

  def setFlavor(flavor)
    @flavor = flavor
  end

  def delicious?
    @flavor.to_s == 'black licorice' ? false : true
  end
end