class Source
  attr_reader :name
  attr_accessor :id

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    item.source = self
    @items << item unless item.include?(item)
    @items
  end
end
