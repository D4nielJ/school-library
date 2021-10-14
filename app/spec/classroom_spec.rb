require_relative '../class/index'

describe 'Classroom class' do
  context 'Creating a new classroom' do
    it 'Should create a new classroom with label' do
      classroom = Classroom.new 'Chess'
      expect(classroom.label).to eq 'Chess'
    end

    it 'Should not be an empty label' do
      classroom = Classroom.new 'Chess'
      expect(classroom.label).not_to eq ''
    end
  end
end
