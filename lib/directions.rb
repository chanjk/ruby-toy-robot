module Directions
  class Direction
    attr_reader :dx, :dy

    def initialize(dx, dy)
      @dx, @dy = dx, dy
    end
  end

  NORTH = Direction.new(0, 1)
  EAST = Direction.new(1, 0)
  SOUTH = Direction.new(0, -1)
  WEST = Direction.new(-1, 0)
end
