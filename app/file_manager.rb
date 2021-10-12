require 'fileutils'
require 'json'
require_relative 'class/student'
require_relative 'class/teacher'
require_relative 'class/book'
require_relative 'class/rental'

class FileManager
  def initialize
    @adress = './app/data'
  end

  def fetch
    state = {
      books: [],
      people: [],
      rentals: [],
      exit: false
    }

    fetch_books(state) if File.exist?("#{@adress}/books.json")
    fetch_people(state) if File.exist?("#{@adress}/people.json")
    # fetch_rentals(state) if File.exist?("#{@adress}/rentals.json")

    state
  end

  # def fetch_rentals(state)
  #   rentals_json = File.read("#{@adress}/rentals.json")
  #   p rentals_hash = JSON.parse(rentals_json)
  #   rentals = rentals_hash.map do |_rental|
  #     Rentals.new(id: rentals['id'], name: rentals['name'], author: book['author'])
  #   end
  #   state[:rentals].concat(rentals)
  # end

  def fetch_people(state)
    people_json = File.read("#{@adress}/people.json")
    p people_hash = JSON.parse(people_json)
    students = people_hash['students'].map do |p|
      Student.new(id: p['id'], age: p['age'], name: p['name'], parent_permission: p['parent_permission'])
    end
    teachers = people_hash['teachers'].map do |p|
      Teacher.new(id: p['id'], age: p['age'], name: p['name'], specialization: p['specialization'])
    end
    state[:people].concat(teachers).concat(students)
  end

  def fetch_books(state)
    books_json = File.read("#{@adress}/books.json")
    p books_hash = JSON.parse(books_json)
    books = books_hash.map { |book| Book.new(id: book['id'], title: book['title'], author: book['author']) }
    state[:books].concat(books)
  end

  def save(state)
    create_files
    save_books(state)
    save_people(state)
    save_rentals(state)
  end

  def create_files
    Dir.mkdir(@adress) unless Dir.exist?(@adress)
    FileUtils.touch("#{@adress}/books.json") unless File.exist?("#{@adress}/books.json")
    FileUtils.touch("#{@adress}/people.json") unless File.exist?("#{@adress}/people.json")
    FileUtils.touch("#{@adress}/rentals.json") unless File.exist?("#{@adress}/rentals.json")
  end

  def save_books(state)
    books_hash = state[:books].map { |book| { id: book.id, title: book.title, author: book.author } }
    books_json = JSON.generate(books_hash)
    File.open("#{@adress}/books.json", 'w') { |f| f.write books_json }
  end

  def save_people(state)
    students = state[:people].select { |person| person.instance_of?(Student) }

    students_hash = students.map do |person|
      { id: person.id, name: person.name, age: person.age, parent_permission: person.parent_permission }
    end

    teachers = state[:people].select { |person| person.instance_of?(Teacher) }

    teachers_hash = teachers.map do |person|
      { id: person.id, name: person.name, age: person.age, specialization: person.specialization }
    end

    people_json = JSON.generate({ students: students_hash, teachers: teachers_hash })
    File.open("#{@adress}/people.json", 'w') { |f| f.write people_json }
  end

  def save_rentals(state)
    rentals_hash = state[:rentals].map do |rental|
      { date: rental.date, book_id: rental.book.id, person_id: rental.person.id }
    end
    rentals_json = JSON.generate(rentals_hash)
    File.open("#{@adress}/rentals.json", 'w') { |f| f.write rentals_json }
  end
end
