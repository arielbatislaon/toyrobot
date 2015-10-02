  # toyrobot_spec.rb
  require 'rspec/core/formatters/documentation_formatter'
  
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
        @robot.should_receive(:move)
        @robot.doCommand("MOVE")
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
    
      it "raises error if  command=xxx" do
        expect {@robot.doCommand("xxx") }.to raise_error 
      end
    
      
    end  
    
    describe "PLACE Comand " do
      describe "robot in valid position" do
      it "sets position without error" do
        expect {@robot.place("1,1,NORTH")}.to_not raise_error
        expected_position={"X"=>1,"Y"=>1,"F"=>"NORTH"}
        @robot.position.should == expected_position
      end  
      it "sets position without error more example using valid position" do  
        expect {@robot.place("1,1,SOUTH")}.to_not raise_error
        expected_position={"X"=>1,"Y"=>1,"F"=>"SOUTH"}
        @robot.position.should == expected_position
      end
      it "sets position without error more example using valid position" do  
        expect {@robot.place("4,1,SOUTH")}.to_not raise_error
        expected_position={"X"=>4,"Y"=>1,"F"=>"SOUTH"}
        @robot.position.should == expected_position
      end
      end
      describe "robot in invalid position" do
      it "raises error and robot position unchanged if position is invalid that is x,y value exceeds table size)" do
        expect {@robot.place("4,1,SOUTH")}.to_not raise_error
        previous_position=@robot.position.clone
        expect {@robot.place("5,5,NORTH")}.to raise_error
        @robot.position.should == previous_position
      end  
      it "raises error and robot position unchanged if position is invalid that is facing is invalid F=xxx)" do
        expect {@robot.place("2,2,SOUTH")}.to_not raise_error
        previous_position=@robot.position.clone
        expect {@robot.place("1,1,xxx")}.to raise_error
        @robot.position.should == previous_position
      end
     end   
      
    end
    
   describe "MOVE Comand " do
    
      it "raises error if robot is not yet on the table - PLACE command not called yet" do
        expect {@robot.move()}.to raise_error
      end
      describe("test robot movement upon placing robot in valid position start from th center facing north") do
      it "sets position without error if robot is still  within table and raises error if robot is already on the edge" do
        expect {@robot.place("2,2,NORTH")}.to_not raise_error
        expect {@robot.move()}.to_not raise_error
        expected_position={"X"=>2,"Y"=>3,"F"=>"NORTH"}
        @robot.position.should eq(expected_position)
        expect {@robot.move()}.to_not raise_error
        expected_position={"X"=>2,"Y"=>4,"F"=>"NORTH"}
        @robot.position.should eq(expected_position)
        
        expect {@robot.move()}.to raise_error
        @robot.position.should eq(expected_position)
        
      end
      end
      describe("test robot movement upon placing robot in valid position start from the center facing SOUTH") do
      it "sets position without error if robot is still  within table and raises error if robot is already on the edge" do
        expect {@robot.place("2,2,SOUTH")}.to_not raise_error
        expect {@robot.move()}.to_not raise_error
        expected_position={"X"=>2,"Y"=>1,"F"=>"SOUTH"}
        @robot.position.should eq(expected_position)
        expect {@robot.move()}.to_not raise_error
        expected_position={"X"=>2,"Y"=>0,"F"=>"SOUTH"}
        @robot.position.should eq(expected_position)
        
        expect {@robot.move()}.to raise_error
        @robot.position.should eq(expected_position)
        
      end
    end
  
     describe("test robot movement upon placing robot in valid position start from the center facing EAST") do
      it "sets position without error if robot is still  within table and raises error if robot is already on the edge" do
        expect {@robot.place("2,2,EAST")}.to_not raise_error
        expect {@robot.move()}.to_not raise_error
        expected_position={"X"=>3,"Y"=>2,"F"=>"EAST"}
        @robot.position.should eq(expected_position)
        expect {@robot.move()}.to_not raise_error
        expected_position={"X"=>4,"Y"=>2,"F"=>"EAST"}
        @robot.position.should eq(expected_position)
        
        expect {@robot.move()}.to raise_error
        @robot.position.should eq(expected_position)
        
      end
    end
  
     describe("test robot movement upon placing robot in valid position start from the center facing WEST") do
      it "sets position without error if robot is still  within table and raises error if robot is already on the edge" do
        expect {@robot.place("2,2,WEST")}.to_not raise_error
        expect {@robot.move()}.to_not raise_error
        expected_position={"X"=>1,"Y"=>2,"F"=>"WEST"}
        @robot.position.should eq(expected_position)
        expect {@robot.move()}.to_not raise_error
        expected_position={"X"=>0,"Y"=>2,"F"=>"WEST"}
        @robot.position.should eq(expected_position)
        
        expect {@robot.move()}.to raise_error
        @robot.position.should eq(expected_position)
        
      end
    end
   end
   
   describe "LEFT Comand " do
    
      it "raises error if robot is not yet on the table - PLACE command not called yet" do
        expect {@robot.left()}.to raise_error
      end
      describe("test robot rotates counter clockwise faces from north->west->south->east and back to north") do
        it "sets position facing north  without error upon placing center 2,2,NORTH and robot rotates counter clockwise by continously calling LEFT" do
          expect {@robot.place("2,2,NORTH")}.to_not raise_error
          
          expect {@robot.left()}.to_not raise_error
          expected_position={"X"=>2,"Y"=>2,"F"=>"WEST"}
          @robot.position.should eq(expected_position)

          expect {@robot.left()}.to_not raise_error
          expected_position={"X"=>2,"Y"=>2,"F"=>"SOUTH"}
          @robot.position.should eq(expected_position)
          
          expect {@robot.left()}.to_not raise_error
          expected_position={"X"=>2,"Y"=>2,"F"=>"EAST"}
          @robot.position.should eq(expected_position)
          
          expect {@robot.left()}.to_not raise_error
          expected_position={"X"=>2,"Y"=>2,"F"=>"NORTH"}
          @robot.position.should eq(expected_position)

        end
       
      end
   end

   describe "RIGHT Comand " do
    
      it "raises error if robot is not yet on the table - PLACE command not called yet" do
        expect {@robot.right()}.to raise_error
      end
      describe("test robot rotates clockwise faces from north->east->south->west and back to north") do
        it "sets position facing north  without error upon placing center 2,2,NORTH and robot rotates  clockwise by continously calling LEFT" do
          expect {@robot.place("2,2,NORTH")}.to_not raise_error
          
          expect {@robot.right()}.to_not raise_error
          expected_position={"X"=>2,"Y"=>2,"F"=>"EAST"}
          @robot.position.should eq(expected_position)

          expect {@robot.right()}.to_not raise_error
          expected_position={"X"=>2,"Y"=>2,"F"=>"SOUTH"}
          @robot.position.should eq(expected_position)
          
          expect {@robot.right()}.to_not raise_error
          expected_position={"X"=>2,"Y"=>2,"F"=>"WEST"}
          @robot.position.should eq(expected_position)
          
          expect {@robot.right()}.to_not raise_error
          expected_position={"X"=>2,"Y"=>2,"F"=>"NORTH"}
          @robot.position.should eq(expected_position)

        end
       
      end
   end

   
  end 
