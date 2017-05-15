require_relative 'directions'
require_relative 'robot'
require_relative 'table'

module Simulator
  def self.play(run_count = nil, robot = nil)
    if run_count
      return if run_count <= 0
      run_count -= 1
    end

    print "> "

    stringArray = gets.chomp.strip.upcase.split
    command, args = stringArray[0], stringArray[1..-1].flat_map { |s| s.split(",") }

    next_robot =
      if command == "PLACE" && args.length >= 3
        x, y = [args[0], args[1]].map { |s| if s.match(/^\d+$/) then s.to_i end }
        direction = DIRECTIONS[args[2]]

        Robot.new(x, y, direction) if [x, y, direction].none?(&:nil?)
      elsif !robot.nil?
        case command
          when "MOVE" then robot.move
          when "LEFT" then robot.turn_left
          when "RIGHT" then robot.turn_right
          when "REPORT"
            puts robot
            robot
        end
      end

    if next_robot && TABLE.contains?(next_robot.x, next_robot.y)
      play(run_count, next_robot)
    else
      play(run_count, robot)
    end
  end

  DIRECTIONS = {
    "NORTH" => Directions::NORTH,
    "EAST" => Directions::EAST,
    "SOUTH" => Directions::SOUTH,
    "WEST" => Directions::WEST,
  }

  TABLE = Table.new(5, 5)
end
