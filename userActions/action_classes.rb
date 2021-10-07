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
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp
    return puts 'Invalid option' if person_type != '1' && person_type != '2'

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    person = create_person(age, name, person_type)
    @state[:people] << person
    puts 'created succesfully'
  end

  def create_person(age, name, person_type)
    if person_type == '1'
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp
      parent_permission = parent_permission.downcase == 'y'
      puts '-----'
      puts 'Student with:'
      puts "Name: #{name}"
      puts "Age: #{age}"
      puts "Parent permission: #{parent_permission}"
      Student.new(age: age, name: name, parent_permission: parent_permission)
    else
      print 'Specialization: '
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

  def do_action; end
end

class CreateRental < AbstractAction
  def initialize(*args)
    super
    @name = 'Create a rental'
  end

  def do_action; end
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
