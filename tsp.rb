# Traveling Salesman Puzzle
class TSP

  def self.solve(distances)
    new(distances).solve

  end

  private

  attr_accessor :distances

  def initialize(distances)
    self.distances = distances
  end

  public

  def solve


  end

end
