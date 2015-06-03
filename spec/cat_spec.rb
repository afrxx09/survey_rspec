require 'spec_helper'

describe Cat do

  subject do
    cat = Cat.new
    cat.name = 'Mr. Whiskers'
    cat.color = 'black'
    cat.age = 3
    cat
  end

  it "has a name" do
    expect(subject.name).to eq('Mr. Whiskers')
  end

  it "has a color" do
    expect(subject.color).to eq('black')
  end

  it "has an age" do
    expect(subject.age).to eq(3)
  end

  describe "eating" do

    it "can be hungry" do
      expect(subject.hungry).to be true
    end

    it "can eat and wont be hungry after" do
      subject.eat
      expect(subject.hungry).to be false
    end

    it "wont eat if not hungry" do
      subject.hungry = false
      expect(subject.eat).to be false
    end

  end

  describe "sleeping" do

    it "can be sleepy" do
      expect(subject.sleepy).to be true
    end

    it "can sleep and wont be sleepy after" do
      subject.sleep
      expect(subject.sleepy).to be false
    end

  end

  describe "hunting" do

    it "can hunt for prey" do
      subject.sleepy = false
      prey = "rat"
      
      hunt_success = subject.hunt(prey)

      expect(hunt_success).to be true
      expect(subject.preys).to include(prey)
    end

    it "wont hunt if it is sleepy" do
      subject.sleepy = true
      prey = "mouse"
      
      hunt_success = subject.hunt(prey)

      expect(hunt_success).to be false
      expect(subject.sleepy).to be true
    end

    it "is hungry and sleepy after a hunt" do
      subject.sleep
      prey = "mouse"

      hunt_success = subject.hunt(prey)

      expect(hunt_success).to be true
      expect(subject.sleepy).to be true
      expect(subject.hungry).to be true
    end

  end

end