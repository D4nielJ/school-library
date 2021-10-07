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
    return puts 'Invalid option' if person_type != 1 && person_type != 2

    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    person =
      if person_type == '1'
        print 'Has parent permission? [Y/N]: '
        parent_permission = gets.chomp
        parent_permission = parent_permission.downcase == 'y'

        Student.new(age, name, parent_permission)
      else
        print 'Specialization: '
        specialization = gets.chomp

        Teacher.new(age, name, specialization)
      end

    @state[:people] << person
    puts 'Person created'
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
