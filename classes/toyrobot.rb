class RobotIsNotYetOnTheTableException < Exception
end




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
    x = pos_array[0].to_i
    y = pos_array[1].to_i
    f = pos_array[2]
   
      if x<0 or x>@table["max_col"]-1 or y<0 or y>@table["max_row"]-1
        raise "Robot is off the table with position:"+@position.to_s
      end
      
      raise  'Invalid Direction:'+f  unless @facing.include?(f)
    
      @position["X"]=pos_array[0].to_i;
      @position["Y"]=pos_array[1].to_i;
      @position["F"]=pos_array[2];
    
  end
  
  def move()
    error_msg="Robot is already on the edge"
    if @position.empty?
      raise RobotIsNotYetOnTheTableException, "Robot is not yet on the table"
    end
    
    robot_facing = @position["F"]
    pos_x = @position["X"]
    pos_y = @position["Y"]
    case robot_facing
    when 'NORTH'
          if pos_y<@table["max_row"]-1
            @position["Y"]+=1
          else
            raise error_msg
          end  
    when 'EAST'
          if pos_x<@table["max_col"]-1
            @position["X"]+=1
          else
            raise error_msg
          end
    when 'SOUTH'
       if pos_y>0
            @position["Y"]-=1
          else
            raise error_msg
       end
          
    when 'WEST'
       if pos_x>0
            @position["X"]-=1
          else
            raise error_msg
       end

    else
        raise "Robot invalid direction facing:"+robot_facing
    end
    
  end
   
  def left

    if @position.empty?
      raise RobotIsNotYetOnTheTableException, "Robot is not yet on the table"
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
        raise "Robot invalid direction facing:"+robot_facing
    end
    
  end
  
  def right

    if @position.empty?
      raise RobotIsNotYetOnTheTableException ,"Robot is not yet on the table"
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
        raise "Robot invalid direction facing:"+robot_facing
    end
    
  end
  
  def report
    if @position.empty?
      raise RobotIsNotYetOnTheTableException ,"Robot is not yet on the table"
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
    
    raise  'Invalid Command:'+cmd  unless @command.include?(parsedCmd["cmd"])
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



