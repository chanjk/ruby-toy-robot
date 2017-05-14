module Directions
  class Direction
    attr_reader :dx, :dy

    def initialize(name, dx, dy)
      @name, @dx, @dy = name, dx, dy
    end

    def to_s
      @name
    end
  end

  def self.left(direction)
    case direction
      when NORTH then WEST
      when EAST then NORTH
      when SOUTH then EAST
      when WEST then SOUTH
    end
  end

  def self.right(direction)
    left left left direction
  end

  NORTH = Direction.new("NORTH", 0, 1)
  EAST = Direction.new("EAST", 1, 0)
  SOUTH = Direction.new("SOUTH", 0, -1)
  WEST = Direction.new("WEST", -1, 0)
end
