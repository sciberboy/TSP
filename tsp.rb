# Traveling Salesman Puzzle
class TSP

  START = 0

  private_constant :START

  def self.solve(travel_times)
    new(travel_times).solve
  end

  private

  attr_accessor :travel_times

  def initialize(travel_times)
    self.travel_times = travel_times
  end

  public

  def solve; end

end
