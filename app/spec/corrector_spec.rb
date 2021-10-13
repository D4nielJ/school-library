Dir[File.join(__dir__, '../class', '*.rb')].each { |file| require_relative file }

describe 'Corrector class' do
  context 'Runing Corrector' do
    it 'Should cut a long name' do
      corrector = Corrector.new
      name = corrector.correct_name('Kasparov1234567890Carlsen')
      expect(name).to eq 'Kasparov12'
    end

    it 'Should capitalize first character' do
      corrector = Corrector.new
      name = corrector.correct_name('carlsen')
      expect(name).to eq 'Carlsen'
    end

    it 'Should not change name if correct' do
      corrector = Corrector.new
      name = corrector.correct_name('Karpov')
      expect(name).to eq 'Karpov'
    end
  end
end
