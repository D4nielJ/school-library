class Person
  def initialize(name = "unknown", age, parent_permission = true)
    @name = name
    @age = age
    @parent_permission = parent_permission      
  end
  
  attr_reader :id
  attr_accessor :name
  attr_accessor :age
end
