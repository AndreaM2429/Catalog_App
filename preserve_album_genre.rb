require_relative 'app'
require_relative 'music_album'
require_relative 'genre'
require 'json'

class PreserveAlbumGenre
  attr_reader :albums, :genres

  def initialize(albums, genres)
    @albums = albums
    @genres = genres
  end

  def save_music_albums
    return if @albums.empty?

    album_data = @albums.map do |album|
      {
        id: album.id,
        publish_date: album.publish_date,
        on_spotify: album.on_spotify,
        archived: album.archived,
        genre: album.genre,
        label: {
          title: album.label.title,
          color: album.label.color
        },
        author: {
          first_name: album.author.first_name,
          last_name: album.author.last_name
        }
      }
    end
    File.write('albums.json', JSON.pretty_generate(album_data))
  end

  def load_music_albums
    return unless File.exist?('albums.json')

    album_data = JSON.parse(File.read('albums.json'))
    album_data.each do |album|
      new_album = MusicAlbum.new(publish_date: album['publish_date'], on_spotify: album['on_spotify'])
      genre = Genre.new(album['genre'])
      label = Label.new(album['label']['title'], album['label']['color'])
      author = Author.new(first_name: album['author']['first_name'], last_name: album['author']['last_name'])
      new_album.author = author
      new_album.id = album['id']
      new_album.genre = genre
      new_album.label = label
      new_album.archived = album['archived']
      @albums << new_album
    end
  end

  def save_genres
    return if @genres.empty?

    genre_data = @genres.map do |genre|
      {
        id: genre.id,
        name: genre.name
      }
    end
    File.write('genres.json', JSON.pretty_generate(genre_data))
  end

  def load_genres
    return unless File.exist?('genres.json')

    genre_data = JSON.parse(File.read('genres.json'))
    genre_data.each do |genre|
      existing_genre = @genres.find { |g| g.id == genre['id'] }
      @genres << Genre.new(genre['name'], genre['id']) unless existing_genre
    end
  end
end
