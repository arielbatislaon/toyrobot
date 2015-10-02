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
     @robot.should respond_to(:place)  
    end
  
  
    it "is moveable" do
      @robot.should respond_to(:move)  
    end
  

  
    it "is moveable to the left" do
      @robot.should respond_to(:left)  
    end
  

  
    it "is moveable to the right" do
      @robot.should respond_to(:right)  
    end
  

  
    it "can report current position" do
      @robot.should respond_to(:report)  
    end
    
    it "can accept command" do
      @robot.should respond_to(:doCommand)  
    end
    
  end
  
  describe "doComand to only accept valid comands: [PLACE,MOVE,LEFT,RIGHT,REPORT]  " do
    it "calls robot.place if command=PLACE" do
      @robot.should_receive(:place).with("x,y,f")
      @robot.doCommand("PLACE x,y,f")
    end
    it "calls robot.move if command=MOVE" do
      @robot.should_receive(:move).with("x,y")
      @robot.doCommand("MOVE x,y")
    end
    it "calls robot.left if command=LEFT" do
      @robot.should_receive(:left)
      @robot.doCommand("LEFT")
    end
    it "calls robot.right if command=RIGHT" do
      @robot.should_receive(:right)
      @robot.doCommand("RIGHT")
    end
    it "calls robot.report if command=REPORT" do
      @robot.should_receive(:report)
      @robot.doCommand("REPORT")
    end
    
  end  
  
end 
