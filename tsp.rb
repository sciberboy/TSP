# Traveling Salesman Puzzle - Site-seeing edition
START = 0

def solve(travel_times, path = [START])
  travel_time = ->(stops) { stops.each_cons(2).sum { |a, b| travel_times[a][b] } }
  number_of_stops = travel_times.size

  if path.size == number_of_stops
    time = travel_time.call(path + [START])
    puts (path + [START]).join('-') + " Times:#{time}"
  else
    stops = (1...number_of_stops).to_a - path
    stops.each do |next_stop|
      solve(travel_times, path + [next_stop])
    end
  end
end

if __FILE__ == $PROGRAM_NAME
  travel_times = [
    [ 0, 10, 15, 20],
    [10,  0, 35, 25],
    [15, 35,  0, 30],
    [20, 25, 30,  0]
  ]

  solve(travel_times)

end
