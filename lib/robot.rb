require_relative 'directions'

class Robot
  attr_reader :x, :y, :direction

  def initialize(x, y, direction)
    @x, @y, @direction = x, y, direction
  end

  def move
    self.class.new(x + direction.dx, y + direction.dy, direction)
  end
end
