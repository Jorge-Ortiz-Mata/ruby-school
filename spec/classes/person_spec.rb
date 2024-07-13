# spec/car_spec.rb
require 'spec_helper'
require_relative '../../classes/person'

RSpec.describe Person do
  let(:person) { build(:person) }

  describe 'public methods' do
    it 'should introduce' do
      expect(person.introduce).to eql "Hello! I'm Jorge"
    end

    it 'buy a car using the Car class' do
      car_instance = person.buy_car('KIA', 'Forte', 2017)

      expect(car_instance.class).to eql Car
    end

    it 'shows the car details' do
      person.buy_car('KIA', 'Forte', 2017)

      expect(person.show_car).to eql "The car' details I purchase are: \n Make: KIA\n Model: Forte\n Year: 2017"
    end
  end
end
