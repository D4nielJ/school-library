require_relative 'rental'

class Book
  attr_reader :rentals
  attr_accessor :title, :author

  def initialize(title:, author: 'anonymous')
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(date, person)
    Rental.new(date: date, book: self, person: person)
  end
end