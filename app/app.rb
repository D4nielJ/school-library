Dir[File.join(__dir__, 'userActions/subclass', '*.rb')].each { |file| require_relative file }
require_relative 'initial_state'

class App
  def initialize(
    initial_state = {
      books: [],
      people: [],
      rentals: [],
      exit: false
    }
  )
    @state_fetcher = HardcodedState.new
    @state = initial_state
    @actions = [
      ListBooks.new,
      ListPeople.new,
      CreatePerson.new,
      CreateBook.new,
      CreateRental.new,
      ListRentals.new,
      Exit.new
    ]
  end

  def init
    @state = @state_fetcher.fetch
    puts '----- Welcome to the ---->'
    puts '----- OOP School Library Software -----'
    stay_idle
  end

  private

  def stay_idle
    puts 'Please choose an option by entering a number:'
    puts '-----'
    @actions.each_with_index do |action, i|
      puts "#{i + 1} - #{action.name}"
    end
    number_choose = gets.chomp.to_i
    puts '-----'
    @actions[number_choose - 1].do_action(@state)
    puts '-----'
    stay_idle unless @state[:exit]
  end
end
