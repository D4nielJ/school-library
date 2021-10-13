Dir[File.join(__dir__, '../class', '*.rb')].each { |file| require_relative file }

describe Rental do
  context 'With valid input' do
    it 'should instansiate a rental with person Richie Rod' do
      per = Rental.new(date: 'November 11, 2021', person: 'Richie Rod', book: 'The way')
      expect(per.date == 'November 11, 2021').to be true
    end
  end
end
