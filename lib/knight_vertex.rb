class KnightVertex
  private

  attr_reader :coordinates, :adjacent_coordinates

  def initialize(coordinates)
    @coordinates = coordinates
    @adjacent_coordinates = filter_coordinates_list(possible_adjacent_coordinates)
  end

  def possible_adjacent_coordinates # rubocop:disable Metrics/AbcSize
    [
      [coordinates[0] + 2, coordinates[1] + 1],
      [coordinates[0] + 2, coordinates[1] - 1],
      [coordinates[0] + 1, coordinates[1] + 2],
      [coordinates[0] + 1, coordinates[1] - 2],

      [coordinates[0] - 2, coordinates[1] + 1],
      [coordinates[0] - 2, coordinates[1] - 1],
      [coordinates[0] - 1, coordinates[1] + 2],
      [coordinates[0] - 1, coordinates[1] - 2]
    ]
  end

  def valid?(coordinate_pair)
    coordinate_pair.all? { |coordinate| coordinate.between?(0, 7) }
  end

  def filter_coordinates_list(coordinates_list)
    coordinates_list.select { |coordinate_pair| valid?(coordinate_pair) }
  end
end
