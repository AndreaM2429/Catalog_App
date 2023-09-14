require_relative '../label'
require_relative '../item'

describe Label do
  before :each do
    @label = Label.new('Gift', 'purple', nil)
    @item = Item.new(publish_date: '20/07/2020')
  end

  it 'Should be an instance of Label class' do
    expect(@label).to be_instance_of(Label)
  end

  it 'The method add_item should add items inside the instance of Label' do
    @label.add_item(@item)
    expect(@item).to be_instance_of(Item)
    expect(@label.items.length).to be 1
  end

  it 'Return the correct property title' do
    expect(@label.title).to eq 'Gift'
  end
end
