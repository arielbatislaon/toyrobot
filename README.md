# toyrobot
Toy Robot Ruby Coding  Exercise

How to run  :

   First download the source code as either by
   git clone https://github.com/arielbatislaon/toyrobot.git
   or downloading as zip file and unzipping it to your local folder
   
   This requires the Ruby Interpreter  if you dont have the Ruby interpreter you can download and install it from:
   https://www.ruby-lang.org/en/downloads/. Download the latest current stable
   
   Once you've download the source code, the structure of the folders should look like this :
   
        if you download the  zip:
        <The Folder where you unpack the sour code>/toyrobot-master/classes  - contains the runnable ruby codes
        <The Folder where you unpack the sour code>/toyrobot-master/spec     - contains the test specs of the apps
        
        if you git clone
        
        <The Folder where you unpack the sour code>/toyrobot/classes  - contains the runnable ruby codes
        <The Folder where you unpack the sour code>/toyrobot/spec     - contains the test specs of the apps
     
     
     then run
       
        <The Folder where you unpack the sour code>/.../classes>ruby toyrobot_main.rb
        
        
  Running the Test :
       Running test requires RSPEC module.
       To install RSPEC modules in the comand line run:
       
          gem install rspec
       for more info visit : https://www.relishapp.com/rspec/docs/gettingstarted
       
       then run <The Folder where you unpack the sour code>/.../spec>ruby toyrobot_spec.rb 
       
 The motivation in writing this coding challenges is based on below requirment
 
 Toy Robot Simulator
===================

Description
-----------

- The application is a simulation of a toy robot moving on a square tabletop,
  of dimensions 5 units x 5 units.
- There are no other obstructions on the table surface.
- The robot is free to roam around the surface of the table, but must be
  prevented from falling to destruction. Any movement that would result in the
  robot falling from the table must be prevented, however further valid
  movement commands must still be allowed.

Create an application that can read in commands of the following form:

    PLACE X,Y,F
    MOVE
    LEFT
    RIGHT
    REPORT

- PLACE will put the toy robot on the table in position X,Y and facing NORTH,
  SOUTH, EAST or WEST.
- The origin (0,0) can be considered to be the SOUTH WEST most corner.
- The first valid command to the robot is a PLACE command, after that, any
  sequence of commands may be issued, in any order, including another PLACE
  command. The application should discard all commands in the sequence until
  a valid PLACE command has been executed.
- MOVE will move the toy robot one unit forward in the direction it is
  currently facing.
- LEFT and RIGHT will rotate the robot 90 degrees in the specified direction
  without changing the position of the robot.
- REPORT will announce the X,Y and F of the robot. This can be in any form,
  but standard output is sufficient.

- A robot that is not on the table can choose the ignore the MOVE, LEFT, RIGHT
  and REPORT commands.
- Input can be from a file, or from standard input, as the developer chooses.
- Provide test data to exercise the application.

Constraints
-----------

- The toy robot must not fall off the table during movement. This also
  includes the initial placement of the toy robot.
- Any move that would cause the robot to fall must be ignored.

Example Input and Output
------------------------

### Example a

    PLACE 0,0,NORTH
    MOVE
    REPORT

Expected output:

    0,1,NORTH

### Example b

    PLACE 0,0,NORTH
    LEFT
    REPORT

Expected output:

    0,0,WEST

### Example c

    PLACE 1,2,EAST
    MOVE
    MOVE
    LEFT
    MOVE
    REPORT

Expected output

    3,3,NORTH

      
      

