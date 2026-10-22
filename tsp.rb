# Traveling Salesman Puzzle - Site-seeing edition
class TSP
  START = 0

  attr_accessor :travel_times

  def self.solve(travel_times)
    new(travel_times).solve
  end

  def initialize(travel_times)
    self.travel_times = travel_times
  end

  def solve(path = [START], shortest = { path: nil, time: Float::INFINITY })
    travel_time = ->(stops) { stops.each_cons(2).sum { |a, b| travel_times[a][b] } }
    number_of_stops = travel_times.size

    if path.size == number_of_stops
      time = travel_time.call(path + [START])
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
    # JHB   CPT   DUR   PE    PTA   BFN   KIM   EL    NLP   POL
    [   0, 1402,  578, 1075,   58,  398,  472,  982,  355,  319], # JHB
    [1402,    0, 1753,  769, 1460, 1004,  962, 1089, 1762, 1721], # CPT
    [ 578, 1753,    0,  984,  636,  634,  811,  674,  707,  897], # DUR
    [1075,  769,  984,    0, 1133,  677,  743,  310, 1434, 1394], # PE
    [  58, 1460,  636, 1133,    0,  456,  530, 1040,  330,  270], # PTA
    [ 398, 1004,  634,  677,  456,    0,  177,  584,  755,  720], # BFN
    [ 472,  962,  811,  743,  530,  177,    0,  780,  827,  791], # KIM
    [ 982, 1089,  674,  310, 1040,  584,  780,    0, 1276, 1301], # EL
    [ 355, 1762,  707, 1434,  330,  755,  827, 1276,    0,  315], # NLP
    [ 319, 1721,  897, 1394,  270,  720,  791, 1301,  315,    0]  # POL
  ]

  shortest = TSP.solve(travel_times)
  puts "Shortest: #{shortest[:path].join('-')} Time: #{shortest[:time]} minutes"

end
