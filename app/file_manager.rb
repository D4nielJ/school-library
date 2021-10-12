class FileManager
  def fetch
    initial_state = {
      books: [],
      people: [],
      rentals: [],
      exit: false
    }
    
    ## Load files

    ## initial_state << books_array if books.json
    ## initial_state << people_array if books.json
    ## initial_state << rentals_array if books.json
    
    initial_state
  end

  def save(state)
    ## Write to files
  end
end