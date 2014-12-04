class Node
  attr_reader :id, :data, :edges, :distance, :visited, :neighbors, :previous
  attr_writer :distance, :neighbors, :previous
  def initialize(id, data)
    @id = id
    @data = data
    @edges = []
    @neighbors = {}
    @distance = Float::INFINITY
    # previous node in path to source
    @previous
  end

  def add_edge(edge)
    @edges << edge
    if edge.head != self
      @neighbors[edge.head.id] = edge.head
    else
      @neighbors[edge.tail.id] = edge.tail
    end
  end

  def print_info
    puts "This node has #{@edges.size} edges"
  end

end
