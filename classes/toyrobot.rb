class ToyRobot
  
  def initialize()
      @position = Hash.new
      @command  = ["PLACE","MOVE","LEFT","RIGHT","REPORT"]
  end
  
  def place(parm)
    
  end
  
  def move(parm)
    puts 'move has been called'
  end
  
  def left
    
  end
  
  def right
    
  end
  
  def report
    
  end
  
  def doCommand(cmd)
    
    cmd_array1 = cmd.split(" ")
    cmd_array2 = cmd.split(cmd_array1[0]+' ')
    raise  'Invalid Command:'+cmd  unless @command.include?(cmd_array1[0])
    cmd_array = cmd.split(" ")
    
    case cmd_array[0]
    when 'PLACE'
          place(cmd_array2[1])
    when 'MOVE'
          move(cmd_array2[1])
    when 'LEFT'
          left
    when 'RIGHT'
           right
    when 'REPORT'
          report
    end
  end
end

