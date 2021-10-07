require_relative 'userActions/action_classes'

class App
  def initialize(initial_state)
    @state = initial_state
    @actions = [ListBooks.new(@state), ListPeople.new(@state)]
  end

  def init
    puts 'Please choose an option by enter in a number:'
    @actions.each_with_index do |action, i|
      puts "#{i + 1} - #{action.name}"
    end
    number_choose = gets.chomp.to_i
    @state = @actions[number_choose - 1].do_action
    @state[:books].concat(%w[book1 book2 book3])
    @actions[number_choose - 1].do_action
  end
end

def main
  initial_state = {
    books: [],
    people: [],
    rentals: []
  }
  app = App.new(initial_state)
  app.init
end

main
