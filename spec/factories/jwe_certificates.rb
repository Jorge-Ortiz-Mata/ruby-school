# frozen_string_literal: false

# factories/jwe_certificates.rb
FactoryBot.define do
  factory :jwe_certificate do
    payload { { id: 1, name: 'Jorge', role: 'admin' } }

    initialize_with { new(payload) }
  end
end
