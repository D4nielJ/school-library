require_relative 'app/app'
require_relative 'app/initial_state'

def main
  app = App.new(state_fetcher: HardcodedState.new)
  app.init
end

main
