require_relative 'item'

class Genre
  attr_accessor :name

  def initialize(name, id = nil)
    @id = id || Random.rand(1..1000)
    @name = name
    @items = []
  end

  def add_item(item)
    return unless item.is_a?(Item)

    @items << item
    item.genre = self
  end

  private

  attr_accessor :id, :items
end
