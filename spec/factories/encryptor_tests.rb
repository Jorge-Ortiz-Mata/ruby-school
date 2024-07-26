# frozen_string_literal: false

# factories/encryptor_tests.rb
FactoryBot.define do
  factory :encryptor_test do
    algorithm { 'aes-128-cbc' }
    key { OpenSSL::Cipher.new(algorithm).random_key }

    initialize_with { new(algorithm, key) }
  end
end
