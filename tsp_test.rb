require 'minitest/autorun'
require_relative 'tsp'

class TSPTest < Minitest::Test
  # https://www.geeksforgeeks.org/dsa/travelling-salesman-problem-using-hungarian-method/
  def test_optimal_tour_length_classic_4_cities
    TravelTime = [
      [ 0, 10, 15, 20],
      [10,  0, 35, 25],
      [15, 35,  0, 30],
      [20, 25, 30,  0]
    ]

    tsp = TSP.new(distances)
    assert_equal 80, tsp.solve
  end

end
