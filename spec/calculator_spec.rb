require 'spec_helper'

describe Calculator do

  subject { Calculator.new }

  describe "addition" do

    it "can add two numbers" do
      expect(subject.add(1,2)).to eq(3)
    end

    it "can use negative numbers" do
      expect(subject.add(-1,-1)).to eq(-2)
    end

  end

  describe "division" do
    
    it "can divide two whole numbers" do
      result = subject.divide(6, 2)
      expect(result).to eq(3)
    end

    it "can divide decimal numbers" do 
      result = subject.divide(5.5, 2)
      expect(result).to eq(2.75)
    end

    it "Error occurs if devisor is 0" do
      expect { subject.divide(4, 0) }.to raise_error
    end

  end

end

