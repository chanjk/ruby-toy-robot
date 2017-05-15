class Table
  def initialize(width, length)
    @width, @length = width, length
  end

  def contains?(x, y)
    (x.between? 0, @width - 1) && (y.between? 0, @length - 1)
  end
end
