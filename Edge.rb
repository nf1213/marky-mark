class Edge
  attr_reader :id, :data
  def initialize(head, tail, id, data)
    @head = head
    @tail = tail
    @id = id
    @data = data
    @head.add_edge(self)
    @tail.add_edge(self)
  end
end
