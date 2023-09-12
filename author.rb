require_relative 'item'

class Author
  attr_reader :first_name, :last_name

  def initialize(id: nil, first_name, last_name,)
    @id: id || Random.rand(1..1000)
    @item = []
  end

  def add_item(item)
    @item << item
    item.author = self
  end

  private

  attr_accessor :id, :item
end