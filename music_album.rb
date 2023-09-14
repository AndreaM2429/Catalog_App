require_relative 'item'

class MusicAlbum < Item
  attr_accessor :on_spotify, :id

  def initialize(publish_date:, on_spotify: false)
    super(publish_date: publish_date, id: id, archived: archived)
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
