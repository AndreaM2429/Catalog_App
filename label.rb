require_relative 'item'

class Label
  attr_reader :items, :title, :color, :id

  def initialize(title, color, id = nil)
    @id = id || Random.rand(1...1000)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item
    item.label = self
  end
end
