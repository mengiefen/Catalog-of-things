class Source
  attr_reader :name

  def initialize(id, name)
    @id = id
    @name = name
    @items = []
  end

  def add_item(item)
    item.source = self
    @items << item unless item.include?(item)
    @items
  end
end
