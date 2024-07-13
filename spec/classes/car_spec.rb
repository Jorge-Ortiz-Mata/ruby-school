# spec/car_spec.rb
require 'spec_helper'
require_relative '../../classes/car'

RSpec.describe Car do
  let(:car) { build(:car) }

  describe '#initialize' do
    it 'initializes with make, model, and year' do
      expect(car.make).to eq('KIA')
      expect(car.model).to eq('Forte HB Black')
      expect(car.year).to eq(2017)
    end
  end

  describe '.start_engine' do
    it 'returns "Engine started!"' do
      expect(described_class.start_engine).to eq('Engine started!')
    end
  end

  describe '#info' do
    it 'returns the car details' do
      expected_info = "The car's details are: \n Make: KIA\n Model: Forte HB Black\n Year: 2017"
      expect(car.info).to eq(expected_info)
    end
  end
end
