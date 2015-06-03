class Yahtzee

  attr_reader :dice
  attr_reader :round
  attr_reader :saves
  attr_reader :score
  attr_reader :result

  def initialize
    @dice = []
    @saves = []
    @round = 0
    @score = 0
    @result = 'Nothing'
    5.times do
      @dice.push(Die.new)
    end
  end

  def roll_dice
    if @round < 3
      @round +=1
      @dice.each do |d|
        d.roll unless @saves.include?(d) 
      end
    end
    evaluate_dice
  end

  def roll_die(die)
    @dice.each do |d|
      save_die(d) unless d == die
    end
    roll_dice
  end

  def save_die(die)
    @saves.push(die) unless @saves.include?(die)
  end

  def evaluate_dice
    @values = {"1" => 0, "2" => 0, "3" => 0, "4" => 0, "5" => 0, "6" => 0}
    @dice.each do |d|
      @values[d.value.to_s] += 1
    end
    generate_result
  end

  private

    def generate_result
      pair?
      three_of_a_kind?
      two_pairs?
      small_straight?
      big_straight?
      four_of_a_kind?
      full_house?
      yahtzee?
    end

    def pair?
      @values.each do |k, v|
        if v == 2
          @score = 2
          @result = "Pair of #{k}'s"
        end
      end
    end

    def three_of_a_kind?
      @values.each do |k, v|
        if v == 3
          @score = 3
          @result = "Three of a kind with #{k}'s"
        end
      end
    end

    def two_pairs?
      pair1 = 0
      pair2 = 0
      @values.each do |k, v|
        pair1 = k.to_i if v == 2
        pair2 = k.to_i if v == 2 && k.to_i != pair1
      end
      if pair1 > 0 && pair2 > 0
        @score = 4
        @result = "Two pairs, #{pair1}'s and #{pair2}'s"
      end
    end

    def small_straight?
      if @values["1"] > 0 && @values["2"] > 0 && @values["3"] > 0 && @values["4"] > 0 && @values["5"] > 0 
        @score = 5
        @result = "Small straight, 1 to 5"
      end
    end

    def big_straight?
      if @values["2"] > 0 && @values["3"] > 0 && @values["4"] > 0 && @values["5"] > 0 && @values["6"] > 0 
        @score = 6
        @result = "Big straight, 2 to 6"
      end
    end

    def four_of_a_kind?
      @values.each do |k, v|
        if v == 4
          @score = 7
          @result = "Four of a kind with #{k}'s"
        end
      end
      return false
    end

    def full_house?
      pair = 0
      tripple = 0
      @values.each do |k, v|
        pair = k.to_i if v == 2
        tripple = k.to_i if v == 3
      end
      if pair > 0 && tripple > 0
        @score = 8
        @result = "Full house of #{tripple}'s and #{pair}'s"
      end
    end

    def yahtzee?
      @values.each do |k, v|
        if v == 5
          @score = 9
          @result = "Yahtzee with #{k}'s!!"
        end
      end
      return false
    end

end