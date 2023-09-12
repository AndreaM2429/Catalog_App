require_relative 'item'

class Game < Item
  def initialize(date, publish_date)
    super(publish_date)
    @multiplayer = false
    @last_played_at = date
    @list_of_games = []
  end

  def can_be_archived?
    super & @last_played_at > 2.year.ago
  end
end
