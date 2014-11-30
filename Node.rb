class Node
  attr_reader :id, :data
  def initialize(id, data)
    @id = id
    @data = data
    @edges = {}
  end

  def add_edge(edge)
    @edges[edge.id] = edge.data
  end

  def print_info
    puts "This node has #{@edges.size} edges"
  end
end
