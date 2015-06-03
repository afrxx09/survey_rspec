class Cat
  
  attr_accessor :name
  attr_accessor :age
  attr_accessor :color
  attr_accessor :hungry
  attr_accessor :sleepy
  attr_accessor :preys

  def initialize
    @hungry = true
    @sleepy = true
    @preys = []
  end

  def speak
    return "meow!"
  end

  def eat
    return false if !@hungry
    @hungry = false
    return "nom nom"
  end

  def sleep
    @sleepy = false
    return "zzz"
  end

  def hunt(prey)
    return false if @sleepy
    @preys.push(prey)
    @sleepy = true
    @hungry = true
    return true
  end



end