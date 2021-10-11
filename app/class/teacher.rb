require_relative 'person'

class Teacher < Person
  def initialize(specialization:, **args)
    @specialization = specialization
    super(**args)
  end

  def can_use_services?
    true
  end
end
