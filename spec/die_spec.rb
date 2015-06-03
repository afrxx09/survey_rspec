require 'spec_helper'

describe Die do

  it "has a number of sides" do
    sides = 6
    die = Die.new(sides)

    expect(die.sides).to eq(sides)
  end

  it "must have atleast four sides" do
    expect{ die_1 = Die.new(3) }.to raise_error
    expect{ die_2 = Die.new(0) }.to raise_error
  end

  it "can have values that increase by any number greater than 0" do
    sides = 10
    side_value_multiplier = 10
    die = Die.new(sides, side_value_multiplier)

    expect(die.max_roll_value).to eq(100)
    expect(die.min_roll_value).to eq(10)
  end

  it "can be rolled" do
    die = Die.new(20)
    die.roll
    expect(1..20).to include(die.value)
  end

  it "saves its roll_history" do
    die_1 = Die.new(6)
    die_2 = Die.new(20)

    die_1_possible_results = 1..6
    die_2_possible_results = 1..20
    
    10.times do
      die_1.roll
      die_2.roll
    end

    expect(die_1.roll_history.length).to eq(10)
    expect(die_2.roll_history.length).to eq(10)
    expect(die_1_possible_results).to include(*die_1.roll_history)
    expect(die_2_possible_results).to include(*die_2.roll_history)
  end

end