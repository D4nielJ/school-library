require_relative '../class/index'

describe Teacher do
  it 'create a new Teacher with correct attributes and methods' do
    teacher = Teacher.new(name: 'John Doe', age: 17, specialization: 'specialization')

    expect(teacher).to have_attributes(name: 'John doe')
    expect(teacher).to have_attributes(age: 17)
    expect(teacher).to have_attributes(specialization: 'specialization')
    expect(teacher).to have_attributes(parent_permission: true)
    expect(teacher).to have_attributes(rentals: [])
    expect(teacher.id).to be_between(1, 100_000).inclusive
    expect(teacher.of_age?).to eql false
    expect(teacher.can_use_services?).to eql true
    expect(teacher.instance_of?(Teacher)).to eql true
    expect(teacher.is_a?(Person)).to eql true
  end
end
