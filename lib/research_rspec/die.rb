class Die

  attr_reader :sides
  attr_reader :multiplier
  attr_reader :value
  attr_reader :roll_history

  def initialize(sides = 6, multiplier = 1)
    raise "Sides muest be a number" if !sides.is_a? Integer
    raise "Sides must be more than 4" if sides < 4
    raise "Multiplier must be a number" if !multiplier.is_a? Integer
    raise "Mulitplier must be atleast 1" if multiplier < 1
    @sides = sides
    @multiplier = multiplier
    @value = 0
    @roll_history = []
  end

  def roll
    @value = (1 + rand(sides)) * @multiplier
    @roll_history.push(@value)
  end

  def roll_count
    return @roll_history.length
  end

  def max_roll_value
    return @sides * @multiplier
  end

  def min_roll_value
    return @multiplier
  end

  def cheat_value(value)
    @value = value 
  end

end