class Graph
  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(data)
    node = Node.new(data)
    @nodes << node
  end

  def add_edge(head_node, tail_node, data)
    edge = Edge.new(head_node, tail_node, data)
    @edges << edge
  end
end
