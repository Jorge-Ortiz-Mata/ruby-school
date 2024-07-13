# spec/car_spec.rb
require 'spec_helper'
require_relative '../../classes/electric_car'

RSpec.describe ElectricCar do
  let(:electric_car) { build(:electric_car) }

  describe 'public methods' do
    it 'should show the battery range' do
      expect(electric_car.battery_range).to eql 'The battery of the car is 12 volts'
    end

    it 'should the electric car info' do
      expect(electric_car.info).to eql electric_car.battery_range
    end
  end
end
