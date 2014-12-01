class Edge
  attr_reader :data, :head, :id, :tail
  def initialize(head, tail, id, data)
    @head = head
    @tail = tail
    @data = data
    @id = id
    @head.add_edge(self)
    @tail.add_edge(self)
  end
end
