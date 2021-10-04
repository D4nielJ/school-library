require_relative 'person'

class Student < Person
  def initialize(classroom, age, *optional_data)
    super(age, *optional_data)
    @classroom = classroom
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end

daniel = Student.new('A1', 27, 'daniel')

p daniel
