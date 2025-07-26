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

  public

  # rubocop:disable all
  def knight_moves
    reset
    until discovered_coordinates.read == end_coordinates
      current_coordinates = discovered_coordinates.read
      adjacent_coordinates = filter_coordinates_list(possible_adjacent_coordinates(current_coordinates))

      adjacent_coordinates.each do |coordinate_pair|
        unless visited_coordinates.include?(coordinate_pair) || discovered_coordinates.include?(coordinate_pair)
          discovered_coordinates.enqueue(coordinate_pair)
        end
      end

      visited_coordinates << current_coordinates
      discovered_coordinates.dequeue
    end
    discovered_coordinates.read
  end
end
# rubocop:enable all

# Driver Script
k = KnightsTravails.new
p k
p k.knight_moves
p k.knight_moves
p k
