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

  def solve
    p travel_times
  end

end

if __FILE__ == $PROGRAM_NAME
  travel_times = [
    [0, 10, 15, 20],
    [10, 0, 35, 25],
    [15, 35, 0, 30],
    [20, 25, 30, 0]
  ]
  puts 'Solution:'
  puts TSP.solve(travel_times)
end
