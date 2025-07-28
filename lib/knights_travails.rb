require_relative "adjacent_coordinates"
require_relative "custom_queue"

# Searches the implicit graph using BFS and determines the shortest path between the source and
# destination coordinates.
class KnightsTravails
  include AdjacentCoordinates

  private

  attr_reader :start_coordinates, :end_coordinates
  attr_accessor :visited, :discovered, :path

  def initialize(start_coordinates = generate_coordinates, end_coordinates = generate_coordinates)
    @start_coordinates = start_coordinates
    @end_coordinates = end_coordinates

    @visited = Set.new
    @discovered = CustomQueue.new
    @path = { start_coordinates => nil }
    discovered.enqueue({ coords: start_coordinates, prev: nil })
  end

  def generate_coordinates
    [rand(8), rand(8)]
  end

  def bfs # rubocop:disable Metrics/AbcSize,Metrics/MethodLength
    until path.include?(end_coordinates)
      curr = discovered.read
      curr_coords = curr[:coords]
      neighbors = adjacent_coordinates(curr_coords)

      neighbors.each do |neighbor|
        next if visited.include?(neighbor) || discovered.include?(neighbor)

        path[neighbor] = curr_coords
        discovered.enqueue({ coords: neighbor, prev: curr_coords })
      end

      visited << curr_coords
      discovered.dequeue
    end

    path
  end

  def reconstruct_path(shortest_path = [end_coordinates], curr_coords = path[end_coordinates])
    return shortest_path.reverse if curr_coords.nil?

    reconstruct_path(shortest_path << curr_coords, path[curr_coords])
  end

  public

  def knight_moves
    bfs
    shortest_path = reconstruct_path
    puts "Your start coordinates were: #{start_coordinates}\n" \
         "Your end coordinates were: #{end_coordinates}\n" \
         "You reached your destination in #{shortest_path.length - 1} moves.\n" \
         "Here was your path:\n"
    shortest_path.each { |coords| p coords }
  end
end
