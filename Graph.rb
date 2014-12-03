class Graph
  attr_reader :edges, :nodes
  attr_writer :nodes
  def initialize
    @nodes = {}
    @edges = []
  end

  def add_node(node)
    @nodes[node.id] = node
  end

  def add_edge(edge)
    @edges << edge
  end

  def print_info
    puts "#{@nodes.size} nodes."
    puts "#{@edges.size} edges."
  end

  def find_actor_by_name(name)
    nodes['170']
  end
end
