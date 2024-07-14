# spec/shape_spec.rb
require 'spec_helper'
require_relative '../../classes/shape'

RSpec.describe Shape do
  let(:shape) { build(:shape) }

  describe 'public methods' do
    it 'shows the area' do
      expect(shape.area).to eql 'Calculating area'
    end
  end
end
