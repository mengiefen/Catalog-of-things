require 'date'

class Item
  attr_reader :id, :archived, :genre, :author, :source, :label
  attr_accessor :publish_date

  def initialize(id, date, archived: false)
    @id = id || Random.rand(1..1000)
    @publish_date = date
    @archived = archived
    @genre = genre
    @author = author
    @source = source
    @label = label
  end

  def move_to_archive
    @archived = true if can_be_archived? == true
  end

  def genre=(genre)
    @genre = genre
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.items.push(self) unless author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.items.push(self) unless source.items.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  private

  def can_be_archived?
    ((Date.today - Date.parse(@publish_date)) / 365).to_i > 10
  end
end
