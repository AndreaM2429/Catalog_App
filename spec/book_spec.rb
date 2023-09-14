require_relative '../book'

describe Book do
  before :each do
    @book = Book.new(publish_date: '20/07/2015', publisher: 'oceania', cover_state: 'good')
  end

  it 'Create an instance of Book class' do
    expect(@book).to be_instance_of(Book)
  end

  it 'Method can_be_archived? should return false' do
    expect(@book.can_be_archived?).to be false
  end

  it 'Method can_be_archived? should return true if cover_state change to bad' do
    @book.cover_state = 'bad'
    expect(@book.can_be_archived?).to be true
  end
end
