require_relative 'app/app'
require_relative 'app/initial_state'

def main
  app = App.new(
    state_fetcher: HardcodedState.new,
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
