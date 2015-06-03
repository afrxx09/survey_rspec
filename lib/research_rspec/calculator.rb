class Calculator

  def add(value1, value2)
    return value1 + value2
  end

  def subtract(val1, val2)
    return val1 - val2
  end

  def multiply(val1, val2)
    return val1 * val2
  end

  def divide(dividend, divisor)
    raise 'Can not divide by 0' if divisor == 0
    return dividend / divisor
  end

  def sum(numbers)
    sum = 0
    numbers.each do |n|
      sum += n
    end
    return sum
  end

end