Dir[File.join(__dir__, '../../class', '*.rb')].each { |file| require_relative file }
require_relative '../action_classes'

class CreateBook < AbstractAction
  def initialize(*args)
    super
    @name = 'Create a book'
  end

  def do_action(state)
    print 'Title:'
    title = gets.chomp

    print 'Author:'
    author = gets.chomp

    state[:books] << Book.new(title: title, author: author)
    puts 'Book created successfully'
  end
end
