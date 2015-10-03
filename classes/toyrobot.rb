#!/usr/bin/ruby

require_relative '../classes/toyrobot_exceptions'

class ToyRobot
attr_reader :position, :command  
  def initialize()
      @position = Hash.new
      @command  = ["PLACE","MOVE","LEFT","RIGHT","REPORT"]
      @facing =["NORTH","EAST", "SOUTH", "WEST"]
      @table = {"max_row"=>5,"max_col"=>5 }
  end
  
  def place(parm)
  
    
    pos_array = parm.split(",")
    if !/[0-9]/.match(pos_array[0]) or !/[0-9]/.match(pos_array[1]) # x, y not integer 0-9
	raise InvalidPlaceParametrs, "Invalid Place parameters: corect syntax is PLACE x,y,f;  x and y : integer f:NORTH,EAST,SOUTH"
    end
    x = pos_array[0].to_i
    y = pos_array[1].to_i
    f = pos_array[2]
    if x<0 or x>@table["max_col"]-1 or y<0 or y>@table["max_row"]-1
	    raise RobotIsOffTheTable, "Robot is off the table with position:"+@position.to_s
    end
      
      raise  InValidDirection, "Invalid Direction:"+f+" valid directions are NORTH,EAST,WEST,SOUTH" unless @facing.include?(f)
    
      @position["X"]=pos_array[0].to_i;
      @position["Y"]=pos_array[1].to_i;
      @position["F"]=pos_array[2];
    
  end
  
  def move()
    
    if @position.empty?
      raise RobotIsNotYetOnTheTableException
    end
    
    robot_facing = @position["F"]
    pos_x = @position["X"]
    pos_y = @position["Y"]
    case robot_facing
    when 'NORTH'
	  if pos_y<@table["max_row"]-1
	    @position["Y"]+=1
	  else
	    raise RobotIsOnTheEdge
	  end  
    when 'EAST'
	  if pos_x<@table["max_col"]-1
	    @position["X"]+=1
	  else
	    raise RobotIsOnTheEdge
	  end
    when 'SOUTH'
       if pos_y>0
	    @position["Y"]-=1
	  else
	    raise RobotIsOnTheEdge
       end
	  
    when 'WEST'
       if pos_x>0
	    @position["X"]-=1
	  else
	    raise RobotIsOnTheEdge
       end

    else
	raise InValidDirection,  "Robot invalid direction facing:"+robot_facing+" valid directions are NORTH,EAST,WEST,SOUTH"
    end
    
  end
   
  def left

    if @position.empty?
      raise RobotIsNotYetOnTheTableException
    end

    robot_facing = @position["F"]
    case robot_facing
    when 'NORTH'
	  @position["F"] ="WEST"  
    when 'EAST'
	  @position["F"] ="NORTH"  
    when 'SOUTH'
	 @position["F"] ="EAST"  
	  
    when 'WEST'
       @position["F"] ="SOUTH"  
    else
	raise InValidDirection "Robot invalid direction facing:"+robot_facing+" valid directions are NORTH,EAST,WEST,SOUTH"
    end
    
  end
  
  def right

    if @position.empty?
      raise RobotIsNotYetOnTheTableException 
    end

    robot_facing = @position["F"]
    case robot_facing
    when 'NORTH'
	  @position["F"] ="EAST"  
    when 'EAST'
	  @position["F"] ="SOUTH"  
    when 'SOUTH'
	 @position["F"] ="WEST"  
	  
    when 'WEST'
       @position["F"] ="NORTH"  
    else
	raise InValidDirection, "Robot invalid direction facing:"+robot_facing+" valid directions are NORTH,EAST,WEST,SOUTH"
    end
    
  end
  
  def report
    if @position.empty?
      raise RobotIsNotYetOnTheTableException 
    end
   
   puts @position["X"].to_s+","+@position["Y"].to_s+","+@position["F"]
    
  end
  
  def parsedCommand(cmd)
    cmd_array1 = cmd.split(" ")
    cmd_array2 = cmd.split(cmd_array1[0])
    
    parsedCommand = Hash.new
    parsedCommand["cmd"] = cmd_array1[0]
    if cmd_array2[1].nil?
	parsedCommand["parm"] = ""
	
    else
      parsedCommand["parm"] = cmd_array2[1].strip
    end
     return parsedCommand
    
    
  end
  
  def doCommand(cmd)
    
    parsedCmd = parsedCommand(cmd)
    
    raise  InvalidCommand, 'Invalid Command:'+cmd+". Valid Commands are PLACE, MOVE, LEFT, RIGHT, REPORT"  unless @command.include?(parsedCmd["cmd"])
    cmd_array = cmd.split(" ")
    case cmd_array[0]
    when 'PLACE'
	  place(parsedCmd["parm"])
    when 'MOVE'
	  move
    when 'LEFT'
	  left
    when 'RIGHT'
	   right
    when 'REPORT'
	  report
    end
  
  end
private :parsedCommand
end







  