require './item'

class MusicAlbum < Item
  attr_accessor :on_spotify

  def initialize(date, archive, on_spotify)
    super(date, archive)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
