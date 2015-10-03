#!/usr/bin/ruby

require_relative '../classes/toyrobot'
robot =ToyRobot.new
command =""
while !command.eql?("QUIT")
    puts "Enter Command Below (type in QUIT at anytime to exit)"  
    command = gets.chomp.upcase()
    if !command.eql?("QUIT")
	begin
	    robot.doCommand(command)
	#Handle custom Exceptions    
	rescue RobotIsNotYetOnTheTableException,RobotIsOffTheTable, InValidDirection, RobotIsOnTheEdge, InvalidCommand, InvalidPlaceParametrs =>e
	    puts e.message
	end
    end
    puts "your last command is:"+command
end
