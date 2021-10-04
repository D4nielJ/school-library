class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  attr_reader :id
  attr_accessor :name, :age

  def of_age?
    @age >= 18
  end

  def can_use_services?
    of_age? || @parent_permission
  end
end
