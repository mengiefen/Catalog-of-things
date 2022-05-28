class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(first_name, last_name)
    @id = Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items.push(item) unless @items.include?(item)
    item.author = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      first_name: @first_name,
      last_name: @last_name,
      items: @items
    }.to_json(*args)
  end

  def self.json_create(object)
    author = Author.new(object['first_name'], object['last_name'])
    author.items = object['items']
    author
  end
end
