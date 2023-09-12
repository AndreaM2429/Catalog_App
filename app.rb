require_relative 'genre'
require_relative 'music_album'

class App
  def initialize
    @albums = []
    @genres = []
  end

  def list_all_albums
    if @albums.empty?
      puts "\nThis is empty! :("
    else
      puts "\nList all albums"
      @albums.each do |element|
        puts "ID: #{element.id}
        Published day: #{element.publish_date}
        Archived: #{element.archived ? 'Yes' : 'No'}
        Spotify: #{element.on_spotify ? 'Yes' : 'No'}"
      end
    end
  end

  def add_a_music_album
    print 'Add a Published date:'
    publish_date = gets.chomp.to_s

    print 'Is it on Spotify? [y/n]:'
    on_spotify = gets.chomp.upcase == 'Y'

    print 'Add a genre:'
    genre = Genre.new(gets.chomp.to_s)

    # print 'Add a label:'
    # label = Label.new(gets.chomp.to_s)

    # print 'Add a author:'
    # author = Author.new(gets.chomp.to_s)

    new_album = MusicAlbum.new(publish_date, on_spotify: on_spotify)

    new_album.genre = genre
    # new_album.label = label
    # new_album.author = author
    new_album.move_to_archived

    @albums << new_album
    @genres << genre
  end

  def list_all_genre
    if @genres.empty?
      puts "\nThis is empty! :("
    else
      puts "\nList all albums"
      @genres.each do |element|
        puts " ID: #{element.id}, Genre: #{element.name}"
      end
    end
  end

  def end_app
    puts 'Thank you for using this app (•◡•)丿'
    exit
  end
end
