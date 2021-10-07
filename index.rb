Dir[File.join(__dir__, 'class', '*.rb')].each { |file| require_relative file }

classroom_a = Classroom.new('A')
classroom_b = Classroom.new('B')

student_a = Student.new(17, 'Student A', classroom: classroom_a)
student_b = Student.new(17, 'Student B', classroom: classroom_b)
student_c = Student.new(17, 'Student B', parent_permission: false)

book_a = Book.new(title: 'OOP and OOD with Ruby examples')
book_b = Book.new(title: 'Twenty Thousand Leagues under the Sea', author: 'Julio Verne')
book_c = Book.new(title: 'The Picture of Dorian Gray', author: 'Oscar Wilde')

classroom_b.add_student(student_a)

rentals = []

rentals.push(student_a.add_rental('10-06-2021', book_a))
rentals.push(book_b.add_rental('12-24-2020', student_b))
rentals.push(Rental.new('07-21-2018', book_c, student_a))

p ''
p '## Students'
p ''

p student_a.name, student_b.name

p ''
p '## Classrooms'
p ''

p classroom_a.label, classroom_b.label

p ''
p '## Books'
p ''

p book_a.title, book_b.title, book_c.title

p ''
p '## Rentals'
p ''

rentals.each do |rental|
  p "Rental: #{rental.person.name} rented '#{rental.book.title}' on #{rental.date}"
end
