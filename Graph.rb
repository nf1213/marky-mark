class Graph
  def initialize
    @nodes = []
    @edges = []
  end

  def add_node(id, data)
    node = Node.new(id, data)
    @nodes << node
  end

  def add_edge(head_node, tail_node, id, data)
    edge = Edge.new(head_node, tail_node, id, data)
    @edges << edge
  end
end
