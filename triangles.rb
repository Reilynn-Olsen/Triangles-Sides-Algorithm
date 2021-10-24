module TestErrors
  def checklist(sides)
    sides.sort!
    raise ArgumentError if sides.any? { |s| s <= 0 }
    raise ArgumentError if sides.any?(&:nil?)
    raise ArgumentError if sides[0] + sides[1] <= sides[2]
    true
  end
end

class Triangle
  include TestErrors
  attr_reader :s1, :s2, :s3

  def initialize(s1, s2, s3)
    @s1 = s1
    @s2 = s2
    @s3 = s3
    raise ArgumentError unless checklist([s1, s2, s3]) == true
  end

  def kind
    if s1 == s2 && s2 == s3
      'equilateral'
    elsif s1 == s2 || s2 == s3 || s3 == s1
      'isosceles'
    else
      'scalene'
    end
  end
end
