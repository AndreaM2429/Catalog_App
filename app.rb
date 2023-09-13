require_relative 'genre'
require_relative 'music_album'
require_relative 'book'
require_relative 'author'
require_relative 'label'

class App
  def initialize
    @albums = []
    @genres = []
    @books_list = []
    @labels = []
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

  def create_author(author_name, author_last_name)
    Author.new(nil, author_name, author_last_name)
  end

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

  def end_app
    puts 'Thank you for using this app (•◡•)丿'
    exit
  end
end
