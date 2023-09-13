require 'json'

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
      game.author = game_data['author']
      game.genre = game_data['genre']
      game.label = game_data['label']
      saved_games << game
    end
    saved_games
  end

  def save_games(games)
    return if games.empty?

    data_hash = []
    games.each_with_index do |game, _index|
      data_hash << { label: game.label, genre: game.genre, author: game.author, multiplayer: game.multiplayer,
                     last_played_at: game.last_played_at }
    end
    File.write('./games.json', JSON.dump(data_hash))
  end
end
