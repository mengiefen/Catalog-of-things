require_relative '../classes/item'

class MusicAlbum < Item
  attr_accessor :id, :publish_date, :on_spotify, :items

  def initialize(id, publish_date, on_spotify)
    super(id, publish_date)
    @on_spotify = on_spotify
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      id: @id,
      publish_date: @publish_date,
      on_spotify: @on_spotify
    }.to_json(*args)
  end

  def self.json_create(object)
    MusicAlbum.new(object['id'], object['publish_date'], object['on_spotify'])
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
