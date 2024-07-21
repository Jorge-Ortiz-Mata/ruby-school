# frozen_string_literal: false

# factories/clients.rb
FactoryBot.define do
  factory :client do
    auth_token { ENV['GH_TOKEN'] || 'gh294KakeToken2024' }

    trait :wrong_credentials do
      auth_token { 'myWrongCredentials123' }
    end

    initialize_with { new(auth_token) }
  end
end
