require_relative 'app/app'
require_relative 'app/initial_state'

def main
  initial_state = create_initial_state
  app = App.new(initial_state)
  app.init
end

main
