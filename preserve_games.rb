require 'json'
require_relative 'label'
require_relative 'genre'
require_relative 'author'

class PreserveGames
  def gets_games
    return unless File.exist?('./games.json')

    saved_games = []
    file = File.read('./games.json')
    return [] if file.empty?

    data_hash = JSON.parse(file)
    data_hash.each do |game_data|
      game = Game.new(publish_date: game_data['publish_date'], multiplayer: game_data['multiplayer'])
      game.id = game_data['id']
      game.archived = game_data['archived']
      game.author = Author.new(first_name: game_data['author'], last_name: '')
      game.genre = Genre.new(game_data['genre'])
      game.label = Label.new(game_data['label'], 'N/A')

      saved_games << game
    end
    saved_games
  end

  def save_games(games)
    return if games.empty?

    data_hash = []
    games.each_with_index do |game, _index|
      data_hash << { label: game.label.title, genre: game.genre.name, author: game.author.first_name,
                     multiplayer: game.multiplayer, last_played_at: game.last_played_at }
    end
    File.write('./games.json', JSON.dump(data_hash))
  end
end
