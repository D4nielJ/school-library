require_relative 'app/app'
require_relative 'app/initial_state'

def main
  app = App.new()
  app.init
end

main
