Dir[File.join(__dir__, 'class', '*.rb')].each { |file| require_relative file }

classroom_a = Classroom.new('A')
classroom_b = Classroom.new('B')

student_a = Student.new(17, 'Student A', classroom: classroom_a)
student_b = Student.new(17, 'Student B', classroom: classroom_b)

book_a = Book.new('Narnia')
book_b = Book.new('Cien leguas de viaje submarino', 'Julio Verne')

classroom_b.add_student(student_a)

p '-- Students --'

p student_a
p student_b

p '-- Classrooms --'

p classroom_a
p classroom_b
