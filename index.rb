require_relative 'class/person'
require_relative 'class/student'
require_relative 'class/teacher'

require_relative 'decorators/person/correct_name'

person = Person.new(17, 'Diego', parent_permission: false)

p person
p person.can_use_services?

daniel = Student.new(27, 'Daniel', '11-C')

p daniel

