# spec/car_spec.rb
require 'spec_helper'
require_relative '../../classes/account_password_generator'

RSpec.describe AccountPasswordGenerator do
  let(:account_password_generator) { build(:account_password_generator) }
  let(:regex_lowercase) { /^[a-z]+$/ }
  let(:regex_lowercase_upcase) { /^[a-zA-Z]+$/ }
  let(:regex_lowercase_upcase_numbers) { /^[a-zA-Z0-9]+$/ }
  let(:regex_lowercase_upcase_numbers_characters) { /^[a-zA-Z0-9!@#$%^&*()]+$/ }

  context 'public methods' do
    it 'should render a default message with no option selected' do
      res = account_password_generator.generate_password(nil, 6)

      expect(res).to eql 'The option was not valid. Please enter a valid option'
    end

    it 'should render a password with only lowercase letters with a length of 8' do
      res = account_password_generator.generate_password(1, 8)

      expect(res.length).to eql 8
      expect(res =~ regex_lowercase).to be_truthy
    end

    it 'should render a password with lowercase and upcase letters with a length of 14' do
      res = account_password_generator.generate_password(2, 14)

      expect(res.length).to eql 14
      expect(res =~ regex_lowercase_upcase).to be_truthy
    end

    it 'should render a password with numbers, upcase and lowercase letters with a length of 10' do
      res = account_password_generator.generate_password(3, 10)

      expect(res.length).to eql 10
      expect(res =~ regex_lowercase_upcase_numbers).to be_truthy
    end

    it 'should render a password with numbers, special characters, upcase and lowercase letters with a length of 20' do
      res = account_password_generator.generate_password(4, 20)

      expect(res.length).to eql 20
      expect(res =~ regex_lowercase_upcase_numbers_characters).to be_truthy
    end
  end
end
