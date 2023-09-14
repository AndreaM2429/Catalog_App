require_relative '../author'
require_relative '../item'

describe Author do
  context 'When testing the Author class' do
    it 'should return the author name: Nicolas Bolañez' do
      @author = Author.new(first_name: 'Nicolas', last_name: 'Bolañez')
      puts @author.first_name
      puts @author.last_name
      expect(@author.first_name).to eq 'Nicolas'
      expect(@author.last_name).to eq 'Bolañez'
    end
    let(:author) { Author.new(first_name: 'John', last_name: 'Doe') }
    let(:item) { Item.new(publish_date: '12/09/2023', archived: false) }

    it 'should add an item to the author' do
      author.add_item(item)
      expect(author.item).to include(item)
      expect(item.author).to eq(author)
    end
  end
end
