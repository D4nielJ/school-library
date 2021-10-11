Dir[File.join(__dir__, 'userActions/subclass', '*.rb')].each { |file| require_relative file }

def main
  initial_state = create_initial_state
  app = App.new(initial_state)
  puts '----- Welcome to the ---->'
  app.init
end

main
