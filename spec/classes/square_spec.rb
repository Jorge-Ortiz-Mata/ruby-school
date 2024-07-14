# spec/square_spec.rb
require 'spec_helper'
require_relative '../../classes/square'

RSpec.describe Square do
  let(:square) { build(:square) }

  describe 'public methods' do
    it 'shows the area' do
      expect(square.area).to eql 'Area of the square'
    end
  end
end
