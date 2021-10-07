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
