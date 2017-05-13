module Directions
  class Direction
    attr_reader :dx, :dy

    def initialize(dx, dy)
      @dx, @dy = dx, dy
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

  NORTH = Direction.new(0, 1)
  EAST = Direction.new(1, 0)
  SOUTH = Direction.new(0, -1)
  WEST = Direction.new(-1, 0)
end
