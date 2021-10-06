Dir[File.join(__dir__, 'class', '*.rb')].each { |file| require_relative file }

daniel = Student.new(27, 'BUSARAKHAMANRAS')

p daniel

daniel.validate_name

p daniel
