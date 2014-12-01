class Graph
  attr_reader :edges, :nodes
  def initialize
    @nodes = {}
    @edges = {}
  end

  def add_node(node)
    @nodes[node.id] = node.data
  end

  def add_edge(edge)
    @edges[edge.id] = edge.data
  end

  def print_info
    puts "#{@nodes.size} nodes."
    puts "#{@edges.size} edges."
  end
end
