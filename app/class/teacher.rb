require_relative 'person'

class Teacher < Person
  attr_reader :specialization

  def initialize(specialization:, **args)
    @specialization = specialization
    super(**args)
  end

  def can_use_services?
    true
  end
end
