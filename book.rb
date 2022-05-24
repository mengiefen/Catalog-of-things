require './item'
require 'date'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher, cover_state, date: Date.today)
    super(date)
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    can_be_archived? || @cover_state == 'bad'
  end
end
