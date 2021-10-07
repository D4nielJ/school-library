Dir[File.join(__dir__, '../class', '*.rb')].each { |file| require_relative file }

class AbstractAction
  attr_reader :name
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def do_action
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ListBooks < AbstractAction
  def initialize(*args)
    super
    @name = 'List all books'
  end

  def do_action
    @state[:books].each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end
end

class ListPeople < AbstractAction
  def initialize(*args)
    super
    @name = 'List all people'
  end

  def do_action
    @state[:people].each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end

class CreatePerson < AbstractAction
  def initialize(*args)
    super
    @name = 'Create a person'
  end

  def do_action
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]:'
    person_type = gets.chomp
    return puts 'Invalid option' if person_type != '1' && person_type != '2'

    print 'Age:'
    age = gets.chomp

    print 'Name:'
    name = gets.chomp

    person = create_person(age, name, person_type)
    @state[:people] << person
    puts 'created succesfully'
  end

  def create_person(age, name, person_type)
    if person_type == '1'
      print 'Has parent permission? [Y/N]:'
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'
      puts '-----'
      puts 'Student with:'
      puts "Name: #{name}"
      puts "Age: #{age}"
      puts "Parent permission: #{parent_permission}"
      Student.new(age: age, name: name, parent_permission: parent_permission)
    else
      print 'Specialization:'
      specialization = gets.chomp
      puts '-----'
      puts 'Teacher with:'
      puts "Name: #{name}"
      puts "Age: #{age}"
      puts "Specialization: #{specialization}"
      Teacher.new(age: age, name: name, specialization: specialization)
    end
  end
end

class CreateBook < AbstractAction
  def initialize(*args)
    super
    @name = 'Create a book'
  end

  def do_action
    print 'Title:'
    title = gets.chomp

    print 'Author:'
    author = gets.chomp

    @state[:books] << Book.new(title: title, author: author)
    puts 'Book created successfully'
  end
end

class CreateRental < AbstractAction
  def initialize(*args)
    super
    @name = 'Create a rental'
  end

  def do_action
    puts 'Select a book from the following list by number:'

    @state[:books].each_with_index do |book, idx|
      puts "#{idx + 1}) Title: \"#{book.title}\", Author: #{book.author}"
    end
    book_idx = gets.chomp.to_i - 1

    puts 'Select a person from the following list by number (not id):'
    @state[:people].each_with_index do |person, idx|
      puts "#{idx + 1}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    person_idx = gets.chomp.to_i - 1

    print 'Date:'
    date = gets.chomp

    @state[:rentals] << Rental.new(
      date: date,
      book: @state[:books][person_idx],
      people: @state[:people][person_idx]
    )

    puts 'Rental created successfully'
  end
end

class ListRentals < AbstractAction
  def initialize(*args)
    super
    @name = 'List all rentals for a given person id'
  end

  def do_action; end
end

class Exit < AbstractAction
  def initialize(*args)
    super
    @name = 'Exit'
  end

  def do_action
    p 'Come back soon'
    @state[:exit] = true
  end
end
