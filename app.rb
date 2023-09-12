class App
  def initialize
    @books_list = []
  end

  def list_all_books
    if @books_list.empty?
      puts "\n There is no books yet"
    else
      puts "\n List of books"
      @books_list.each_with_index do |book, index|
        puts "#{index}: #{book.label.title} by #{book.autor.first_name} #{book.author.last_name}"
      end
    end
  end

  def add_a_book
    p "Book's tittle: "
    title = gets.chomp
    p "Author's first name: "
    author_name = gets.chomp
    p "Author's last name: "
    author_last_name = gets.chomp
    p "Book's publish date [dd/mm/yyyy]: "
    publish_date = gets.chomp
    p "Book's publisher: "
    publisher = gets.chomp
    p "Book's genre: "
    genre = gets.chomp
    p "Book's cover color"
    color = gets.chomp
    p "Book's cover state: "
    cover_state = gets.chomp

    create_book(publish_date, publisher, cover_state, genre, author_name, author_last_name, title, color)
  end

  def create_book
    new_book = Book.new(publish_date, publisher, cover_state)
    new_book.genre = Genre.new(genre)
    new_book.author = Author.new(author_name, author_last_name)
    new_book.label = Label.new(title, color)
    @books_list << new_book
  end
end
