# toyrobot_spec.rb

require 'spec_helper'

RSpec.describe ToyRobot do
  describe "#place" do
    it "is placeable" do
      robot = ToyRobot.new
      expect{robot.place}.not_to raise_error
    end
  end

  describe "#move" do
    it "is moveable" do
      robot = ToyRobot.new
      expect{robot.move}.not_to raise_error
    end
  end  
end