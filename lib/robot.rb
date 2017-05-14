require_relative 'directions'

class Robot
  attr_reader :x, :y, :direction

  def initialize(x, y, direction)
    @x, @y, @direction = x, y, direction
  end

  def move
    self.class.new(x + direction.dx, y + direction.dy, direction)
  end

  def turn_left
    self.class.new(x, y, Directions.left(direction))
  end

  def turn_right
    self.class.new(x, y, Directions.right(direction))
  end
end
