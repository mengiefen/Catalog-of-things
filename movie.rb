require_relative 'item'

class Movie
  attr_reader :sillet
  
  def initialize(sillet, id, published_date)
    super(id, published_date)
    @sillet =sillet
end

    private

    def can_be_archived?
        super && @sillet
    end
end