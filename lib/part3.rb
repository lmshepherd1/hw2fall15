class Dessert

  def initialize(name, calories)
    if name.empty?  or calories <= 0
      raise ArgumentError.new("Invalid parameters")
    else
      @name = name
      @calories = calories
    end
  end
  
  # getters
  def name
    @name
  end
  def calories
    @calories
  end
  
  # setters
  def name=(new_name)
    @name
  end
  def calories=(new_calories)
    @calories
  end
  
  def healthy?
    @healthy = @calories < 200
  end
  
  def delicious?
    @delicious = true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    if name.empty?  or calories <= 0 or flavor.nil?
      raise ArgumentError.new("Invalid parameters")
    else
      @name = name
      @calories = calories
      @flavor = flavor
    end
  end
  
  # getter
  def flavor 
    @flavor
  end
  
  # setter
  def flavor=(new_flavor)
    @flavor - new_flavor
  end
  
  def delicious?
    if @flavor == 'black licorice'
      return false
    else
      return true
    end
  end
end
