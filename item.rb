
require 'date'

class Item
  attr_accessor :publish_date

  def initialize(publish_date, id = nil)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = false
    @genre = []
    @author = []
    @label = []
  end

  def genre=(genre)
    @genre = genre
    genre.genres.push(self) unless genre.genres.include?(self)
  end

  def author=(author)
    @author = author
    author.authors.push(self) unless author.authors.include?(self)
  end

  def label=(label)
    @label = label
    label.labels.push(self) unless label.labels.include?(self)
  end

  def move_to_archived
    @archived = true if can_be_archieved?
  end

  private

  def can_be_archieved?
    publish_date = @publish_date.split('/')
    publish_date = Time.new(publish_date[2], publish_date[1], publish_date[0])

    current_date = Time.now.strftime('%d/%m/%Y').split('/')
    current_date = Time.new(current_date[2], current_date[1], current_date[0])

    ( (current_date.year - publish_date.year) + ((current_date.month - publish_date.month) / 12) ) >= 10
  end
end
