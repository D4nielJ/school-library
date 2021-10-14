require_relative '../class/index'

describe Person do
  it 'create a new person with correct attributes and methods' do
    person = Person.new(name: 'John Doe', age: 17, parent_permission: false)

    expect(person).to have_attributes(name: 'John doe')
    expect(person).to have_attributes(age: 17)
    expect(person).to have_attributes(parent_permission: false)
    expect(person).to have_attributes(rentals: [])
    expect(person.id).to be_between(1, 100_000).inclusive
    expect(person.of_age?).to eql false
    expect(person.can_use_services?).to eql false
  end
end
