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
