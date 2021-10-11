Dir[File.join(__dir__, '../../class', '*.rb')].each { |file| require_relative file }
require_relative '../action_classes'

class ListPeople < AbstractAction
  def initialize(*args)
    super
    @name = 'List all people'
  end

  def do_action(state)
    state[:people].each do |person|
      puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end
end
