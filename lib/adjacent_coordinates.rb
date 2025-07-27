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

  def in_bounds?(coordinates)
    coordinates.all? { |coordinate| coordinate.between?(0, 7) }
  end

  def filter_coordinates_list(coordinates_list)
    coordinates_list.select { |coordinates| in_bounds?(coordinates) }
  end

  def adjacent_coordinates(coordinates)
    filter_coordinates_list(possible_adjacent_coordinates(coordinates))
  end
end
