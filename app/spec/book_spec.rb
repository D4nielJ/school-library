require_relative '../class/book'

describe 'When testing Book class' do
  it 'should return the correct title and author with getters' do
    test_book = Book.new(title: 'testName', author: 'testAuthor')
    expect(test_book.title).to eq 'testName'
    expect(test_book.author).to eq 'testAuthor'
  end
end
