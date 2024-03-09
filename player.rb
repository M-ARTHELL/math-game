class Player
  attr_accessor :points, :lives

  def initialize
    @lives = 3
    @points = 0
  end

  def add_points
    @points += 1
  end

  def lose_life
    @lives -= 1
  end
end