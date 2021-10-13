require_relative '../class/index'

describe Student do
  it 'create a new Student with correct attributes and methods' do
    student = Student.new(name: 'John Doe', age: 17, parent_permission: false)

    expect(student).to have_attributes(name: 'John doe')
    expect(student).to have_attributes(age: 17)
    expect(student).to have_attributes(parent_permission: false)
    expect(student).to have_attributes(rentals: [])
    expect(student).to have_attributes(classroom: nil)
    expect(student.id).to be_between(1, 100_000).inclusive
    expect(student.of_age?).to eql false
    expect(student.can_use_services?).to eql false
  end
end
