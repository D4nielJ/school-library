require_relative 'ui/ui_methods'

class App
  def initialize(initialState)
    @state = initialState
  end

  def init
    
  end
end

def main
  app = App.new
  app.init
end

main
