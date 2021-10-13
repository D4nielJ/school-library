require_relative '../decorator/corrector'

class Person
  attr_reader :rentals, :parent_permission
  attr_accessor :name, :age, :id

  def initialize(age:, id: Random.rand(1..100_000), name: 'Unknown', parent_permission: true)
    @id = id
    @age = age
    @parent_permission = parent_permission
    @corrector = Corrector.new
    @rentals = []
    @name = validate_name(name)
  end

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def validate_name(name)
    @corrector.correct_name(name)
  end

  def add_rental(date, book)
    Rental.new(date: date, book: book, person: self)
  end
end
