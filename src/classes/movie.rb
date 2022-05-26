require_relative './item'

class Movie < Item
  attr_reader :publish_date, :silent

  def initialize(id, publish_date, silent: false)
    super(publish_date)
    @silent = silent
  end

  def can_be_archived?
    super || @silent
  end
end
