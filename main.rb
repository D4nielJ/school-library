require_relative 'userActions/action_classes'

class App
  def initialize(initial_state)
    @state = initial_state
    @actions = [
      ListBooks.new(@state),
      ListPeople.new(@state),
      CreatePerson.new(@state),
      CreateBook.new(@state),
      CreateRental.new(@state),
      ListRentals.new(@state),
      Exit.new(@state)
    ]
  end

  def init
    puts '----- OOP School Library Software -----'
    puts 'Please choose an option by entering a number:'
    puts '-----'
    @actions.each_with_index do |action, i|
      puts "#{i + 1} - #{action.name}"
    end
    number_choose = gets.chomp.to_i
    puts '-----'
    @actions[number_choose - 1].do_action
    puts '-----'
    init unless @state[:exit]
  end
end

def create_initial_state
  initial_state = {
    books: [],
    people: [],
    rentals: [],
    exit: false
  }

  book_a = Book.new(title: 'OOP and OOD with Ruby examples')
  book_b = Book.new(title: 'Twenty Thousand Leagues under the Sea', author: 'Julio Verne')
  book_c = Book.new(title: 'The Picture of Dorian Gray', author: 'Oscar Wilde')

  student_a = Student.new(age: 17, name: 'George Cloone')
  student_b = Student.new(age: 17, name: 'Brittanny Smirgh')

  rental_a = Rental.new(date: '02-24-2018', book: book_c, person: student_a)
  rental_b = Rental.new(date: '07-12-2020', book: book_b, person: student_a)
  rental_c = Rental.new(date: '05-06-2019', book: book_a, person: student_a)
  rental_d = Rental.new(date: '10-03-2021', book: book_a, person: student_b)

  initial_state[:books].concat([book_a, book_b, book_c])
  initial_state[:people].concat([student_a, student_b])
  initial_state[:rentals].concat([rental_a, rental_b, rental_c, rental_d])
  initial_state
end

def main
  initial_state = create_initial_state
  app = App.new(initial_state)
  puts '----- Welcome to the ---->'
  app.init
end

main
