require 'minitest/autorun'
require_relative 'tsp'
# require_relative '../tsp_hash/tsp_hash'

class TSP < Minitest::Test
  def test_single_city
    dist = [[0]]
    tsp = TSP.new(dist, ['A'])
    result = tsp.solve

    assert_equal 0, result[:cost]
    assert_equal %w[A A], result[:path]
  end

  def test_two_cities
    dist = [
      [0, 10],
      [10, 0]
    ]
    tsp = TSP.new(dist, %w[A B])
    result = tsp.solve

    assert_equal 20, result[:cost]
    assert_equal %w[A B A], result[:path]
  end

  def test_three_cities_symmetric
    dist = [
      [0, 2, 9],
      [2, 0, 4],
      [9, 4, 0]
    ]
    tsp = TSP.new(dist, %w[A B C])
    result = tsp.solve

    assert_equal 15, result[:cost]
    assert_equal %w[A B C A], result[:path]
  end

  def test_four_cities_asymmetric
    # Asymmetric distance matrix where optimal route follows 0 -> 1 -> 2 -> 3 -> 0
    dist = [
      [0, 1, 10, 10],
      [10, 0, 1, 10],
      [10, 10, 0, 1],
      [1, 10, 10, 0]
    ]
    tsp = TSP.new(dist, %w[A B C D])
    result = tsp.solve

    assert_equal 4, result[:cost]
    assert_equal %w[A B C D A], result[:path]
  end

  def test_default_city_indices_when_cities_omitted
    dist = [
      [0, 5, 10],
      [5, 0, 8],
      [10, 8, 0]
    ]
    tsp = TSP.new(dist)
    result = tsp.solve

    assert_equal 23, result[:cost]
    assert_equal [0, 1, 2, 0], result[:path]
  end

  def test_south_african_cities_dataset
    cities = %w[JHB CPT DUR PE PTA BFN KIM EL NLP POL]
    dist = [
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

    tsp = TSP.new(dist, cities)
    result = tsp.solve

    expected_path = %w[JHB PTA POL NLP DUR EL PE CPT KIM BFN JHB]
    expected_cost = 4640

    assert_equal expected_cost, result[:cost]
    assert_equal expected_path, result[:path]
  end



  def test_all_cities_visited_and_tour_is_closed
    cities = %w[City1 City2 City3 City4]
    dist = [
      [0, 3, 2, 1],
      [3, 0, 4, 2],
      [2, 4, 0, 5],
      [1, 2, 5, 0]
    ]

    tsp = TSP.new(dist, cities)
    result = tsp.solve

    path = result[:path]
    assert_equal cities.first, path.first
    assert_equal cities.first, path.last
    assert_equal cities.size + 1, path.size
    assert_equal cities.sort, path[0...-1].sort
  end
end
