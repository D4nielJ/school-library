require_relative '../decorator/corrector'

class Person
  attr_reader :id, :rentals
  attr_accessor :name, :age

  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..100_000)
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
    Rental.new(date, book, self)
  end
end
