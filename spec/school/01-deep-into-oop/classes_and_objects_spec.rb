require_relative '../../../school/01-deep-into-oop/classes_and_objects'
require 'spec_helper'

RSpec.describe Car do
  describe 'It should do something' do
    it 'should show the user information' do
      car = build(:car)
      
      expect(car.info).to eql("The car's details are: \n Make: #{car.make}\n Model: #{car.model}\n Year: #{car.year}")
    end
  end
end
