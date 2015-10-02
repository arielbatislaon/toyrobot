# toyrobot_spec.rb

require 'rspec/autorun'

require "rspec/expectations"

require_relative '../classes/toyrobot'

RSpec.describe ToyRobot do
  
  before(:each) do
    @robot = ToyRobot.new
  end


  describe "ToyRobot features" do
    it "is placeable" do
     @robot.place.should_not raise_error  raise_error
    end
  
  
    it "is moveable" do
      @robot.move.should_not raise_error  raise_error
    end
  

  
    it "is moveable to the left" do
      @robot.left.should_not raise_error  raise_error
    end
  

  
    it "is moveable to the right" do
      @robot.right.should_not raise_error  raise_error
    end
  

  
    it "can report current position" do
      @robot.position.should_not raise_error  raise_error
    end
 end 
end 
