require_relative 'item'

class Game < Item
  def initialize(date)
    super
    @multiplayer = false
    @last_played_at = date
    @list_of_games = []
  end

  def can_be_archived?
    super & @last_played_at > 2.year.ago
  end

  def list_of_games
    puts 'List of Games:'
    @list_of_games.each do |game|
      puts "Game: #{game}"
    end
  end

  def add_a_game(genre, author, source, label, publish_date)
    game = Game.new(genre, author, source, label, publish_date)
    @list_of_games << game
  end
end
