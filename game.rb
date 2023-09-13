require_relative 'item'

class Game < Item
  attr_accessor :author, :genre, :label

  def initialize( publish_date:, multiplayer: false, id: nil, archived: false, author: nil, genre: nil, label: nil)
    super(publish_date: publish_date, id: id, archived: archived)
    id = id || Random.rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = publish_date
    @list_of_games = []

    self.author = author if author
    self.genre = genre if genre
    self.label = label if label
  end

  def can_be_archived?
    super & @last_played_at > 2.year.ago
  end
end