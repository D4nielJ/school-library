require_relative '../class/index'

describe Rental do
  context 'With valid input' do
    it 'should create a rental with person and book objects' do
      person = Person.new(name: 'John Doe', age: 17, parent_permission: false)
      book = Book.new(title: 'testName', author: 'testAuthor')

      rental = Rental.new(date: 'November 11, 2021', person: person, book: book)
      expect(rental.date == 'November 11, 2021').to be true
      expect(rental.book).to eql book
      expect(rental.person).to eql person
      expect(person.rentals).to eql [rental]
      expect(book.rentals).to eql [rental]
    end
  end
end
