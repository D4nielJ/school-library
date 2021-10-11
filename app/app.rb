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