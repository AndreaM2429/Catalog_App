require 'date'

class Item
  attr_accessor :id, :publish_date, :archived
  attr_reader :genre, :author, :label

  def initialize(publish_date:, id: nil, archived: false)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
    @genre = []
    @author = []
    @label = []
  end

  def genre=(genre)
    @genre = genre.name
    genre.items.push(self) unless genre.items.include?(self)
  end

  def author=(author)
    @author = author
    author.item.push(self) unless author.item.include?(self)
  end

  def label=(label)
    @label = label
    label.items.push(self) unless label.items.include?(self)
  end

  def move_to_archived
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    publish_date = @publish_date.split('/')
    publish_date = Time.new(publish_date[2], publish_date[1], publish_date[0])

    current_date = Time.now.strftime('%d/%m/%Y').split('/')
    current_date = Time.new(current_date[2], current_date[1], current_date[0])

    ((current_date.year - publish_date.year) + ((current_date.month - publish_date.month) / 12)) >= 10
  end
end
