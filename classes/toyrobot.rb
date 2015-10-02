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
    puts "pos_array="+pos_array.to_s
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
    puts 'move has been called'
  end
   
  def left
    
  end
  
  def right
    
  end
  
  def report
    
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
          move(parsedCmd["parm"])
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

