require 'json'

class PreserveAuthor
  def gets_author
    return unless File.exist?('./authors.json')

    saved_authors = []
    file = File.read('./authors.json')
    return [] if file.empty?

    data_hash = JSON.parse(file)
    data_hash.each do |author_data|
      author = Author.new(
        id: author_data['id'],
        first_name: author_data['first_name'],
        last_name: author_data['last_name']
      )
      saved_authors << author
    end
    saved_authors
  end

  def save_authors(authors)
    return if authors.empty?

    data_hash = []
    authors.each_with_index do |author, _index|
      data_hash << { first_name: author.first_name, last_name: author.last_name }
    end
    File.write('./authors.json', JSON.dump(data_hash))
  end
end
