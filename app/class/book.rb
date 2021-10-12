require_relative 'rental'

class Book
  attr_reader :rentals
  attr_accessor :title, :author, :id

  def initialize(title:, id: Random.rand(1..100_000), author: 'anonymous')
    @id = id
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date: date, book: self, person: person)
  end
end
