class Triangle
  attr_reader :x, :y, :z
  def initialize(x, y, z)
    @x = x
    @y = y
    @z = z
  end

  def kind
    valid_type
    if x == y && y == z
      :equilateral
    elsif 
      x == y || y == z || x == z
      :isosceles
    else
      :scalene
    end
  end

  def valid_type
    real = [(x + y > z), (x + z > y), (y + z > x)]
    [x, y, z].each do |x|
      real << false if x <= 0
      raise TriangleError if real.include?(false)
    end
  end

  class TriangleError < StandardError
    def message
      "The triangle definied in an instance is not an 
      1) Equilateral
      2) Scalene
      3) Isosceles"
    end
  end

end

test1 = Triangle.new(23,23,23)
puts test1.kind

test2 = Triangle.new(23,20,31)
puts test2.kind

test3 = Triangle.new(23,30,23)
puts test3.kind

test4 = Triangle.new(2,2,2)
puts test4.kind
