Dir[File.join(__dir__, 'userActions/subclass', '*.rb')].each { |file| require_relative file }

class App
  def initialize(
    initial_state = {
      books: [],
      people: [],
      rentals: [],
      exit: false
    }, state_manager: nil,
    actions: []
  )
    @state_manager = state_manager
    @state = initial_state
    @actions = actions
  end

  def init
    @state = @state_manager.fetch if @state_manager
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

    return exit if @state[:exit]

    stay_idle
  end

  def exit
    @state_manager.save(@state)
  end
end
