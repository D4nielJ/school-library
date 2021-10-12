require 'fileutils'
require 'json'
require_relative '../class/student'
require_relative '../class/teacher'

class OutputJson
  def initialize(adress = './app/data')
    @adress = adress
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
