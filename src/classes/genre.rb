class Genre
  attr_reader :id
  attr_accessor :name, :items

  def initialize(name)
    @id = Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item
    item.genre = self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      name: @name,
      items: @items
    }.to_json(*args)
  end

  def self.json_create(object)
    genre = Genre.new(object['name'])
    genre.items = object['items']
    genre
  end
end
