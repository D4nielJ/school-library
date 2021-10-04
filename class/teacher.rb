require_relative 'person'

class Teacher < Person
  def initialize(specialization, age, *optional_data)
    super(age, *optional_data)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end

gabriel = Teacher.new('roedores', 18, 'gabriel')

p gabriel
