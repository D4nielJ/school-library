Dir[File.join(__dir__, '../../class', '*.rb')].each { |file| require_relative file }
require_relative '../action_classes'

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