module AdjacentCoordinates
  def possible_adjacent_coordinates(coordinates) # rubocop:disable Metrics/AbcSize
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

  def in_bounds?(coordinate_pair)
    coordinate_pair.all? { |coordinate| coordinate.between?(0, 7) }
  end

  def filter_coordinates_list(coordinates_list)
    coordinates_list.select { |coordinate_pair| in_bounds?(coordinate_pair) }
  end

  def adjacent_coordinates(coordinate_pair)
    filter_coordinates_list(possible_adjacent_coordinates(coordinate_pair))
  end
end
