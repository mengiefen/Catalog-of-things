require_relative '../classes/item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(id, publish_date, on_spotify: false)
    super(id, publish_date)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [title, author]
    }.to_json(*args)
  end

  def self.json_create(object)
    new(*object['data'])
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
