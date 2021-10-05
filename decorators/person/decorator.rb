class Decorator < Person
  attr_accessor :component

  def initialize(component, *args)
    @component = component
    super(*args)
  end
end
