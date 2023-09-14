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
  end
end
