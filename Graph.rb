class Graph
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
end
