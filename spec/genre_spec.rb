require_relative '../genre'
require_relative '../item'
require 'rspec'

describe Genre do
  context 'when adding a Genre' do
    # Arrange
    let(:genre) { Genre.new('Metal', 32) }

    it 'should have correct attributes' do
      # Act
      name = genre.name

      # Assert
      expect(genre).to be_an_instance_of(Genre)
      expect(name).to eq('Metal')
    end

    it 'should have an empty items array initially' do
      # Act #Assert
      expect(genre.items).to be_empty
    end

    it 'should add an item to its items' do
      # Act
      item = Item.new(publish_date: '21/01/2020')
      genre.add_item(item)
      # Assert
      expect(genre.items).to include(item)
    end
  end
end
