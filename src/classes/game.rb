require_relative 'item'

class Game < Item
  attr_accessor :id, :multiplayer, :last_played_at, :publish_date

  def initialize(id, publish_date, multiplayer, last_played_at)
    super(id, publish_date)
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    current_year = Date.today.year
    last_played_at_year = Date.parse(@last_played_at).year
    super && current_year - last_played_at_year > 2
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      id: @id,
      publish_date: @publish_date,
      multiplayer: @multiplayer,
      last_played_at: @last_played_at
    }.to_json(*args)
  end

  def self.json_create(object)
    Game.new(object['id'], object['publish_date'], object['multiplayer'], object['last_played_at'])
  end
end
