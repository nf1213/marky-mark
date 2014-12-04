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

  def find_edge(node, other_node)
    edges.each do |edge|
      if (edge.head == node && edge.tail == other_node) ||
        (edge.tail == node && edge.head == other_node)
        return edge
      end
    end
    nil
  end

  def print_info
    puts "This node has #{@edges.size} edges"
  end

end
