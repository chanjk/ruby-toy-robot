class Table
  def initialize(width, length)
    @width, @length = width, length
  end

  def contains?(x, y)
    (x.between? 0, 4) && (y.between? 0, 4)
  end
end
