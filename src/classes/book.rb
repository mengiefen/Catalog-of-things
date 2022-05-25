require './item'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, archived: false, date: Date.today.to_s)
    super(date, archived: archived)
    @publisher = publisher
    @cover_state = cover_state
  end

  def can_be_archived?
    super || @cover_state == 'bad'
  end

  private :can_be_archived?

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      id: @id,
      publisher: @publisher,
      cover_state: @cover_state,
      date: @publish_date,
      archived: @archived
    }.to_json(*args)
  end

  def self.json_create(object)
    Book.new(object['publisher'], object['cover_state'])
  end
end
