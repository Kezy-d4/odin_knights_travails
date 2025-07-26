require_relative "adjacent_coordinates"
require_relative "custom_queue"

class KnightsTravails
  include AdjacentCoordinates

  private

  attr_reader :start_coordinates, :end_coordinates
  attr_accessor :visited_coordinates, :discovered_coordinates

  def initialize(start_coordinates = generate_coordinates, end_coordinates = generate_coordinates)
    @start_coordinates = start_coordinates
    @end_coordinates = end_coordinates
    @visited_coordinates = []
    @discovered_coordinates = CustomQueue.new
    discovered_coordinates.enqueue(start_coordinates)
  end

  def generate_coordinates
    [rand(8), rand(8)]
  end

  def reset
    self.visited_coordinates = []
    self.discovered_coordinates = CustomQueue.new
    discovered_coordinates.enqueue(start_coordinates)
  end
end
