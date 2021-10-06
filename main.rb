require_relative 'ui/ui_methods'
class App
  def initialize(ui_methods)
    @ui = UserInterface.new
    @ui_methods = ui_methods
  end

  def init
    puts 'Please choose an option by enter in a number =>'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person'
    puts '7 - Exit'
    choice_number = gets.chomp
    execute(choice_number)
  end

  def execute(number)
    @ui.ui_map(number)
  end
end

def main
  app = App.new()
  app.init
end

main
