Dir[File.join(__dir__, '../../class', '*.rb')].each { |file| require_relative file }
require_relative '../action_classes'

class Exit < AbstractAction
  def initialize(*args)
    super
    @name = 'Exit'
  end

  def do_action
    p 'Come back soon'
    @state[:exit] = true
  end
end