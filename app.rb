class App
  def initialize
    @books_list = []
  end

  def list_all_books
    if @books_list.empty?
      puts "\n There is no books yet" 
    else
      puts "\n List of books"
      @books_list.each_with_index { |book, index| puts "#{index}: #{book.label.title} by #{book.autor.first_name} #{book.author.last_name}"}
    end
  end

  def add_book
    p "Book's tittle: "
    label = gets.chomp

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

    new_book = Book.new(publish_date, publisher, cover_state)
    new_book.genre = Genre.new(genre)
    new_book.author = Author.new(author_name, author_last_name)
    new_book.label = Label.new(title, color)

    @books_list << new_book
  end
end
