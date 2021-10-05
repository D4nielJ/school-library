require_relative 'decorator'

class Corrector < Decorator
  def initialize(name, *args)
    @name = name.capitalize.slice(0..9)
    super(*args)
  end
end
