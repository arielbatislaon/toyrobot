# toyrobot_spec.rb

require 'rspec/autorun'

require_relative '../classes/toyrobot'

RSpec.describe ToyRobot do
  describe "#place" do
    it "is placeable" do
      robot = ToyRobot.new
      robot.place.should_not raise_error  raise_error
    end
  end

  describe "#move" do
    it "is moveable" do
      robot = ToyRobot.new
      robot.move.should_not raise_error  raise_error
    end
  end  
end