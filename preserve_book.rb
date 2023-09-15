require 'json'
require_relative 'book'

class PreserveBooks
  def gets_books(genres, authors, labels)
    return unless File.exist?('./books.json')

    saved_books = []
    file = File.read('./books.json')
    data = JSON.parse(file)

    data.each do |element|
      genre = genres.select { |gen| gen.name == element['genre'] }
      author = authors.select { |aut| aut.first_name == element['author'] }
      label = labels.select { |lab| lab.title == element['label'] }

      book = Book.new(publish_date: element['publish_date'], publisher: element['publisher'],
                      cover_state: element['cover_state'], id: element['id'])
      book.genre = genre[0]
      book.author = author[0]
      book.label = label[0]
      book.archived = element['archived']

      saved_books << book
    end
    saved_books
  end

  def save_books(books)
    return if books.empty?

    data_hash = []

    books.each do |book|
      data_hash << { id: book.id, publish_date: book.publish_date,
                     archived: book.archived, genre: book.genre, author: book.author.first_name,
                     label: book.label.title, publisher: book.publisher, cover_state: book.cover_state }
    end

    File.write('./books.json', JSON.dump(data_hash))
  end
end
