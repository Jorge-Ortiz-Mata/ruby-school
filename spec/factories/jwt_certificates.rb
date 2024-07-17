# frozen_string_literal: false

# factories/jwt_certificates.rb
FactoryBot.define do
  factory :jwt_certificate do
    payload { { id: 1, name: 'Jorge', role: 'admin' } }

    initialize_with { new(payload) }
  end
end
