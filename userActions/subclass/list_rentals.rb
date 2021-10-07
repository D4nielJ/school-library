Dir[File.join(__dir__, '../../class', '*.rb')].each { |file| require_relative file }
require_relative '../action_classes'

class ListRentals < AbstractAction
  def initialize(*args)
    super
    @name = 'List all rentals for a given person id'
  end

  def do_action
    print 'ID of person:'
    id = gets.chomp.to_i

    rentals = @state[:rentals].filter { |rental| rental.person.id == id }
    puts 'Rentals:'
    rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}"
    end
  end
end
