require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :archived

  def initialize(publish_date, on_spotify: false)
    super(publish_date)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
