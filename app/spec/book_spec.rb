require_relative '../class/index'

describe 'When testing Book class' do
  it 'should return the correct title and author with getters' do
    test_book = Book.new(title: 'testName', author: 'testAuthor')
    expect(test_book.title).to eql 'testName'
    expect(test_book.author).to eql 'testAuthor'
  end

  it 'should return the correct title and author with getters' do
    test_book = Book.new(title: 'testName', author: 'testAuthor')
    test_book.title = 'differentTitle'
    test_book.author = 'differentAuthor'
    expect(test_book.title).to eq 'differentTitle'
    expect(test_book.author).to eq 'differentAuthor'
  end

  it 'should have an Id with a value between 1 and 100_000' do
    test_book = Book.new(title: 'testName', author: 'testAuthor')
    expect(test_book.id).to be_between(1, 100_000).inclusive
  end
end
