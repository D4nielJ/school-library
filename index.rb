require_relative 'class/person'
require_relative 'class/student'
require_relative 'class/teacher'

daniel = Student.new(27, 'BUSARAKHAMANRAS', '11-C')

p daniel

daniel.validate_name

p daniel
