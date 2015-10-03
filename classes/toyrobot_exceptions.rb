#!/usr/bin/ruby

class RobotIsNotYetOnTheTableException < Exception
  def message
     "Robot is not yet on the table do a PLACE command first"
  end
end

class RobotIsOffTheTable < Exception
end

class InValidDirection < Exception
end


class RobotIsOnTheEdge < Exception
  def message
     "Robot is already on the edge the dimension of the table is 5X5"
  end
end

class InvalidCommand < Exception
  
end

class InvalidPlaceParametrs < Exception
  
end

