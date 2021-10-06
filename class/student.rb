require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(*args, classroom: nil)
    super(*args)
    @classroom = classroom
    classroom.add_student(self) if classroom && !classroom.students.include?(self)
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self) if classroom && !classroom.students.include?(self)
  end

  def play_hookey
    "¯\(ツ)/¯"
  end
end
