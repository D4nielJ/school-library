require 'fileutils'
require 'json'

class FileManager
  def initialize
    @adress = './app/data'
  end

  def fetch
    {
      books: [],
      people: [],
      rentals: [],
      exit: false
    }

    ## Load files

    ## initial_state << books_array if books.json
    ## initial_state << people_array if books.json
    ## initial_state << rentals_array if books.json
  end

  def save(_state)
    create_files
  end

  def create_files
    Dir.mkdir(@adress) unless Dir.exist?(@adress)
    FileUtils.touch("#{@adress}/books.json") unless File.exist?("#{@adress}/books.json")
    FileUtils.touch("#{@adress}/people.json") unless File.exist?("#{@adress}/people.json")
    FileUtils.touch("#{@adress}/rentals.json") unless File.exist?("#{@adress}/rentals.json")
  end
end
