class Dessert
  def initialize(name, calories)
    # YOUR CODE HERE
    @name, @calories = name, calories
  end

  def name
    @name
  end

  def name=(new_name)
    @name = new_name
  end

  def calories
    @calories
  end

  def calories=(new_calories)
    @calories = new_calories
  end
  
  def healthy?
    # YOUR CODE HERE
    if @calories < 200 
      true
    else
      false
    end
  end
  
  def delicious?
    # YOUR CODE HERE
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    # YOUR CODE HERE
    @name, @calories, @flavor = name, calories, flavor
  end
  
  def flavor
    @flavor
  end

  def flavor=(new_flavor)
    @flavor = new_flavor
  end

  def delicious?
    # YOUR CODE HERE
    if @flavor == "black licorice"
      false
    else
      super
    end
  end
end
