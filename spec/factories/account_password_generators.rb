# frozen_string_literal: false

# factories/account_password_generator.rb
FactoryBot.define do
  factory :account_password_generator do
    email { 'jorge.ortiz@gmail.com' }

    initialize_with { new(email) }
  end
end
