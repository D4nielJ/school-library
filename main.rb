require_relative 'app/app'
require_relative 'app/file_manager'

def main
  app = App.new(
    state_manager: FileManager.new,
    actions: [
      ListBooks.new,
      ListPeople.new,
      CreatePerson.new,
      CreateBook.new,
      CreateRental.new,
      ListRentals.new,
      Exit.new
    ]
  )
  app.init
end

main
