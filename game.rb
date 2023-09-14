require_relative 'item'

class Game < Item
  attr_accessor :author, :genre, :label, :multiplayer, :last_played_at, :id

  def initialize(
    publish_date:,
    multiplayer: false
  )

    super(publish_date: publish_date, id: id, archived: archived)
    id || Random.rand(1..1000)
    @multiplayer = multiplayer
    @last_played_at = publish_date
    @list_of_games = []

    self.genre = genre if genre
    self.label = label if label
    self.multiplayer = multiplayer if multiplayer
    self.last_played_at = last_played_at if last_played_at
  end

  def can_be_archived?
    super && @last_played_at < (Date.today - 2 * 365)
  end
end
