Dir[File.join(__dir__, '../../class', '*.rb')].each { |file| require_relative file }
require_relative '../action_classes'

class ListBooks < AbstractAction
  def initialize(*args)
    super
    @name = 'List all books'
  end

  def do_action
    @state[:books].each do |book|
      puts "Title: \"#{book.title}\", Author: #{book.author}"
    end
  end
end
