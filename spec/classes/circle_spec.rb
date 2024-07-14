# spec/circle_spec.rb
require 'spec_helper'
require_relative '../../classes/circle'

RSpec.describe Circle do
  let(:circle) { build(:circle) }

  describe 'public methods' do
    it 'shows the area' do
      expect(circle.area).to eql 'Area of the circle'
    end
  end
end
