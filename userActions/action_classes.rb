class AbstractAction
  attr_reader :name

  def do_action
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end

class ListBooks < AbstractAction
  def initialize
    super
    @name = 'list books'
  end

  def do_action
    'list_books'
  end
end

class ListPeople < AbstractAction
  def initialize
    super
    @name = 'list people'
  end

  def do_action
    'list_books'
  end
end
