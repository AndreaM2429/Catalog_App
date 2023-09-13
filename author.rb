require_relative 'item'

class Author
  attr_reader :first_name, :last_name, :id, :item

  def initialize(id: nil, first_name: '', last_name: '')
    @id = id || Random.rand(1..1000)
    @first_name = first_name
    @last_name = last_name
    @item = []
  end

  def add_item(item)
    @item << item
    item.author = self
  end
end
