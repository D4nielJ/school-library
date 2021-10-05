require_relative 'person'

class Student < Person
  def initialize(*args, classroom)
    super(*args)
    @classroom = classroom
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end

daniel = Student.new(27, 'Daniel', '11-C')

p daniel
