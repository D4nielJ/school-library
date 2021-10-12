require_relative 'IO_class/input_json'
require_relative 'IO_class/output_json'


class FileManager
  def initialize(adress: './app/data', input: InputJson, output: OutputJson)
    @adress = adress
    @input = input.new(@adress)
    @output = output.new(@adress)
  end

  def fetch
    state = { books: [], people: [], rentals: [], exit: false }

    @input.fetch_books(state) if File.exist?("#{@adress}/books.json")
    @input.fetch_people(state) if File.exist?("#{@adress}/people.json")
    @input.fetch_rentals(state) if File.exist?("#{@adress}/rentals.json")

    state
  end

  def save(state)
    @output.create_files
    @output.save_books(state)
    @output.save_people(state)
    @output.save_rentals(state)
  end
end
