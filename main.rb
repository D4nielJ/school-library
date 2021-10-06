require_relative 'ui/ui_methods'

class App
  def initialize
    @ui = UserInterface.new
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
  end

  def execute(number)
    map = {
      1 => list_all_books,
      2 => list_all_people,
      3 => create_a_person,
      4 => create_a_book,
      5 => create_a_rental,
      6 => list_all_rentals,
      7 => exit_app,
      8 => no_valid_method
    }
    @ui.map(number)
  end
end

def main
  app = App.new
  app.init
end

main
