class Node
  attr_reader :id, :data, :edges
  def initialize(id, data)
    @id = id
    @data = data
    @edges = []
  end

  def add_edge(edge)
    @edges << edge
  end

  def print_info
    puts "This node has #{@edges.size} edges"
  end
end
