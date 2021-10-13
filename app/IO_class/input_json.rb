require 'json'
require_relative '../class/student'
require_relative '../class/teacher'
require_relative '../class/book'
require_relative '../class/rental'

class InputJson
  def initialize(adress = './app/data')
    @adress = adress
  end

  def fetch_books(state)
    books_json = File.read("#{@adress}/books.json")
    books_hash = JSON.parse(books_json)
    books = books_hash.map { |book| Book.new(id: book['id'], title: book['title'], author: book['author']) }
    state[:books].concat(books)
  end

  def fetch_people(state)
    people_json = File.read("#{@adress}/people.json")
    people_hash = JSON.parse(people_json)
    students = people_hash['students'].map do |p|
      Student.new(id: p['id'], age: p['age'], name: p['name'], parent_permission: p['parent_permission'])
    end
    teachers = people_hash['teachers'].map do |p|
      Teacher.new(id: p['id'], age: p['age'], name: p['name'], specialization: p['specialization'])
    end
    state[:people].concat(teachers).concat(students)
  end

  def fetch_rentals(state)
    rentals_json = File.read("#{@adress}/rentals.json")
    rentals_hash = JSON.parse(rentals_json)
    rentals = rentals_hash.map do |rental|
      Rental.new(
        date: rental['date'],
        book: state[:books].select { |book| book.id == rental['book_id'] }[0],
        person: state[:people].select { |person| person.id == rental['person_id'] }[0]
      )
    end
    state[:rentals].concat(rentals)
  end
end
