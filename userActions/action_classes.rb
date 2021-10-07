Dir[File.join(__dir__, '../class', '*.rb')].each { |file| require_relative file }

class AbstractAction
  attr_reader :name
  attr_accessor :state

  def initialize(state)
    @state = state
  end

  def do_action
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ListBooks < AbstractAction
  def initialize(*args)
    super
    @name = 'list books'
  end

  def do_action
    p @state[:books]
    @state
  end
end

class ListPeople < AbstractAction
  def initialize(*args)
    super
    @name = 'list people'
  end

  def do_action
    p @state[:people]
  end
end
