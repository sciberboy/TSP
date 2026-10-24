# Traveling Salesman Puzzle - Site-seeing edition
class TSP
  START = 0
  TRAVEL_TIME = ->(stops, travel_times) { stops.each_cons(2).sum { |a, b| travel_times[a][b] } }

  private_constant :START,
                   :TRAVEL_TIME

  private

  attr_accessor :travel_times

  def self.solve(travel_times)
    new(travel_times).solve
  end

  def initialize(travel_times)
    self.travel_times = travel_times
  end

  public

  def solve(path = [START], shortest = { path: nil, time: Float::INFINITY })

    number_of_stops = travel_times.size

    if path.size == number_of_stops
      time = TRAVEL_TIME.call(path + [START], travel_times)
      # puts (path + [START]).join('-') + " Times:#{time}"
      shortest.update(path: path + [START], time: time) if time < shortest[:time]
    else
      remaining = (1...number_of_stops).to_a - path
      remaining.each do |next_stop|
        solve(path + [next_stop], shortest)
      end
    end

    shortest
  end
end

if __FILE__ == $PROGRAM_NAME
  travel_times = [
    [ 0, 10, 15, 20],
    [10,  0, 35, 25],
    [15, 35,  0, 30],
    [20, 25, 30,  0]
  ]

  shortest = TSP.solve(travel_times)
  puts "Shortest: #{shortest[:path].join('-')} Time: #{shortest[:time]} minutes"

end
