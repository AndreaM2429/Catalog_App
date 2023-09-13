require 'json'

class PreserveGames
  def gets_games
    return unless File.exist?('./games.json')

    saved_games = []
    file = File.read('./games.json')
    data_hash = JSON.parse(file)

    data_hash.each do |game_data|
      # Pass keyword arguments with the correct keys
      game = Game.new(
        publish_date: game_data['publish_date'],
        multiplayer: game_data['multiplayer'],
        id: game_data['id'],
        archived: game_data['archived'],
        author: game_data['author'],
        genre: game_data['genre'],
        label: game_data['label']
      )
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
