require_relative "adjacent_coordinates"
require_relative "custom_queue"

class KnightsTravails
  include AdjacentCoordinates

  private

  attr_reader :start_coordinates, :end_coordinates

  def initialize
    @start_coordinates = generate_coordinates
    @end_coordinates = generate_coordinates
  end

  def generate_coordinates
    [rand(8), rand(8)]
  end
end
