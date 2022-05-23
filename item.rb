require 'date'

class Item
  attr_reader :genre, :author, :source, :label

  def initialize(date, archived: false)
    @id = Random.random(1..1000)
    @publish_date = date
    @archived = archived
  end

  def move_to_archive
    @archive = true if can_be_archived? == true
  end

  private

  def can_be_archived?
    (Date.today - @publish_date) > 10
  end

  def genre=(genre)
    @genre = genre
    genre.item.push(self) unless genre.item.include?(self)
  end
end
