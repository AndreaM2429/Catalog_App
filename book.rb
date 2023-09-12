require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state
  def initialize(publish_date, publisher, cover_state, id = nil)
    super(publish_date, id = id)
    @publisher = publisher
    @cover_state = cover_state
    # @books_list = []
  end

  def can_be_archived?
    if (super || @cover_state == 'bad')
      return true
    else
      false
    end
  end
end
