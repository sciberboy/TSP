class TSP

  def self.solve(distances, cities)
    new(distances, cities).solve

  end

  private

  attr_accessor :distances,
                :cities

  def initialize(distances, cities)
    self.distances = distances
    self.cities = cities
  end

  public

  def solve


  end

end
