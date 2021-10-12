require 'fileutils'
require 'json'
require_relative 'class/student'
require_relative 'class/teacher'

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

  def save(state)
    create_files
    save_books(state)
    save_people(state)
  end

  def create_files
    Dir.mkdir(@adress) unless Dir.exist?(@adress)
    FileUtils.touch("#{@adress}/books.json") unless File.exist?("#{@adress}/books.json")
    FileUtils.touch("#{@adress}/people.json") unless File.exist?("#{@adress}/people.json")
    FileUtils.touch("#{@adress}/rentals.json") unless File.exist?("#{@adress}/rentals.json")
  end

  def save_books(state)
    books_json = JSON.generate(state[:books].map { |book| { title: book.title, author: book.author } })
    File.open("#{@adress}/books.json", 'w') { |f| f.write books_json }
  end

  def save_people(state)
    students = state[:people].select { |person| person.instance_of?(Student) }

    students_hash = students.map do |person|
      { name: person.name, age: person.age, parent_permission: person.parent_permission }
    end

    teachers = state[:people].select { |person| person.instance_of?(Teacher) }

    teachers_hash = teachers.map do |person|
      { name: person.name, age: person.age,
        specialization: person.specialization }
    end

    people_json = JSON.generate(students_hash.concat(teachers_hash))
    File.open("#{@adress}/people.json", 'w') { |f| f.write people_json }
  end

  # def save_rentals
  #   books_json = JSON.generate(state[:books].map { |book| { title: book.title, author: book.author } })
  #   File.open("#{@adress}/books.json", 'w') { |f| f.write books_json }
  # end
end
