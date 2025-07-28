# Facilitates breadth first search of the implicit graph.
class CustomQueue
  private

  attr_accessor :data

  def initialize
    @data = []
  end

  public

  def enqueue(object)
    data << object
    object
  end

  def dequeue
    data.shift
  end

  def read
    data[0]
  end

  def empty?
    data.empty?
  end

  def include?(object)
    data.include?(object)
  end
end
