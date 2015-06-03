require 'spec_helper'

describe Yahtzee do

  subject { Yahtzee.new }

  it "uses 5 dice" do
    expect(subject.dice.length).to eq(5)
  end

  it "can roll all dice" do
    subject.roll_dice
    subject.dice.each do |die|
      expect(die.roll_count).to eq(1)
      expect(1..6).to include(die.value)
    end
  end

  it "can roll only one die" do
    first_die = subject.dice[0]
    second_die = subject.dice[1]

    subject.roll_dice
    subject.roll_die(first_die)

    expect(first_die.roll_count).to eq(2)
    expect(second_die.roll_count).to eq(1)
  end

  it "can save dice that will not be rerolled" do
    die_to_save = subject.dice[3]

    subject.roll_dice
    subject.save_die(die_to_save)
    subject.roll_dice

    expect(die_to_save.roll_count).to eq(1)
  end

  it "can roll maximum 3 times" do
    5.times do
      subject.roll_dice
    end
    subject.dice.each do |die|
      expect(die.roll_count).to eq(3)
    end
  end

  describe "It can evaluate the dice to generate a result" do
    
    before(:example) do
      @die_1 = subject.dice[0]
      @die_2 = subject.dice[1]
      @die_3 = subject.dice[2]
      @die_4 = subject.dice[3]
      @die_5 = subject.dice[4]
    end

    it "two dice with equal value results in a pair" do
      @die_1.cheat_value(6)
      @die_2.cheat_value(6)
      @die_3.cheat_value(2)
      @die_4.cheat_value(3)
      @die_5.cheat_value(4)

      subject.evaluate_dice

      expect(subject.score).to eq(2)
      expect(subject.result).to match(/Pair/)
      expect(subject.result).to match(/6's/)
    end

    it "three dice with equal value results in a three of a kind" do
      @die_1.cheat_value(2)
      @die_2.cheat_value(2)
      @die_3.cheat_value(2)
      @die_4.cheat_value(3)
      @die_5.cheat_value(4)

      subject.evaluate_dice

      expect(subject.score).to eq(3)
      expect(subject.result).to match(/Three of a kind/)
      expect(subject.result).to match(/2's/)
    end

    it "five dice with equal value results in a Yahtzee" do
      @die_1.cheat_value(5)
      @die_2.cheat_value(5)
      @die_3.cheat_value(5)
      @die_4.cheat_value(5)
      @die_5.cheat_value(5)

      subject.evaluate_dice

      expect(subject.score).to eq(9)
      expect(subject.result).to match(/Yahtzee/)
      expect(subject.result).to match(/5's/)
    end

  end

end