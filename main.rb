require_relative 'action_classes'

class App
  def initialize(initial_state)
    @state = initial_state
    @actions = [ListBooks.new, ListPeople.new]
  end

  def init
    puts 'Please choose an option by enter in a number:'
    @actions.methods.each_with_index do |method, i|
      puts "#{i + 1} - #{method.name}"
    end
    number_choose = gets.chomp.to_i
    new_state = @actions.methods[number_choose - 1].do_action(@state)
    @state = new_state
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
