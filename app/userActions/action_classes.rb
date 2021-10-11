class AbstractAction
  attr_reader :name
  attr_accessor :state

  def do_action
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
