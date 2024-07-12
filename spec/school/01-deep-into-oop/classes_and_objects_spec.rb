require_relative '../../../school/01-deep-into-oop/classes_and_objects'

RSpec.describe Car do
  before do
    @car = Car.new('KIA', 'Forte HB Black', 2017)
  end

  describe 'It should do something' do
    it 'should show the user information' do
      expect(@car.info).to eql("The car' details are: \n Make: #{@car.make}\n Model: #{@car.model}\n Year: #{@car.year}")
    end
  end
end
