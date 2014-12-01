class Graph
  attr_reader :edges, :nodes
  def initialize
    @nodes = {}
    @edges = []
  end

  def add_node(node)
    @nodes[node.id] = node
  end

  def add_edge(edge)
    @edges << edge
    edge.head.add_edge(edge)
    edge.tail.add_edge(edge)
  end

  def print_info
    puts "#{@nodes.size} nodes."
    puts "#{@edges.size} edges."
  end
end
