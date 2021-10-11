Dir[File.join(__dir__, '../../class', '*.rb')].each { |file| require_relative file }
require_relative '../action_classes'

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
      book: @state[:books][book_idx],
      person: @state[:people][person_idx]
    )

    puts 'Rental created successfully'
  end
end
