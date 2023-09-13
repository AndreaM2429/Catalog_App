require_relative 'genre'
require_relative 'music_album'
require_relative 'book'
require_relative 'author'
require_relative 'label'
require_relative 'game'

class App
  def initialize
    @albums = []
    @genres = []
    @books_list = []
    @labels = []
    @authors = []
    @games = []
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

  def list_all_books
    if @books_list.empty?
      puts "\nThere is no books yet"
    else
      puts "\nList of books"
      @books_list.each_with_index do |book, index|
        puts "#{index}: #{book.label.title} by #{book.author.first_name} #{book.author.last_name}"
      end
    end
  end

  def list_all_labels
    if @labels.empty?
      puts "\nThere is no labels yet"
    else
      @labels.each_with_index do |label, index|
        puts "#{index}: #{label.title}, #{label.color}"
      end
    end
  end

  def add_a_book
    print "Book's tittle: "
    title = gets.chomp
    print "Author's first name: "
    author_name = gets.chomp
    print "Author's last name: "
    author_last_name = gets.chomp
    print "Book's publish date [dd/mm/yyyy]: "
    publish_date = gets.chomp
    print "Book's publisher: "
    publisher = gets.chomp
    print "Book's genre: "
    genre = gets.chomp
    print "Book's cover color: "
    color = gets.chomp
    print "Book's cover state: "
    cover_state = gets.chomp

    book = create_book(publish_date, publisher, cover_state, genre)
    book.author = create_author(author_name, author_last_name)
    book.label = create_label(title, color)
    @books_list << book
  end

  # def create_author(author_name, author_last_name)
  #   Author.new(first_name: author_name, last_name: author_last_name)
  # end

  def create_label(title, color)
    label = Label.new(title, color)
    @labels << label
    label
  end

  def create_book(publish_date, publisher, cover_state, genre)
    new_book = Book.new(publish_date, publisher, cover_state, nil, false)
    new_book.genre = Genre.new(genre)
    new_book
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

  def add_an_author
    print 'Add an Author:'
    puts 'Add Author`s first name:'
    first_name = gets.chomp.to_s
    puts 'Add Author`s last name:'
    last_name = gets.chomp.to_s

    author = Author.new(first_name: first_name, last_name: last_name)
    print " Author added!: #{author.first_name} #{author.last_name} "

    @authors << author
  end

  def list_all_authors
    if @authors.empty?
      puts "\nThis is empty! :("
    else
      puts "\nList all authors:"
      @authors.each do |author|
        puts " First Name: #{author.first_name}, Last Name: #{author.last_name} "
      end
    end
  end
  
  def add_a_game
    print 'Is it multiplayer? [y/n]:'
    multiplayer = gets.chomp.upcase == 'Y'

    print 'Is it archived? [y/n]:'
    archived = gets.chomp.upcase == 'Y'
    
    print 'Add a Published date:'
    publish_date = gets.chomp.to_s

    print 'Add an Author:'
    author_name = gets.chomp.to_s

    print 'Add a Genre:'
    genre_name = gets.chomp.to_s

    print 'Add a Label:'
    label_name = gets.chomp.to_s

    game = Game.new(publish_date: publish_date, id: nil, archived: archived, multiplayer: multiplayer, author: author_name, genre: genre_name, label: label_name)

    @games << game
    
  end

  def list_all_games
    if @games.empty?
      puts "\nThis is empty! :("
    else
      puts "\nList all games"
      @games.each do |element|
        puts "ID: #{element.id}
        Published day: #{element.publish_date}
        Archived: #{element.archived ? 'Yes' : 'No'}"
      end
    end
  end

  def end_app
    puts 'Thank you for using this app (•◡•)丿'
    exit
  end
end
