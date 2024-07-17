# spec/jwe_certificate_spec.rb
require 'spec_helper'
require_relative '../../classes/jwe_certificate'

RSpec.describe JweCertificate do
  let(:jwe_certificate) { build(:jwe_certificate) }

  describe 'public methods' do
    it 'encodes the payload' do
      key = OpenSSL::PKey::RSA.generate(2048)
      token_encoded = jwe_certificate.encode_token(key)

      expect(token_encoded).to include 'ey'
    end

    it 'decodes the token correctly' do
      key = OpenSSL::PKey::RSA.generate(2048)
      token_encoded = jwe_certificate.encode_token(key)
      payload = jwe_certificate.decode_token(key, token_encoded)

      data = JSON.parse(payload)

      expect(data['id']).to eql 1
      expect(data['name']).to eql 'Jorge'
      expect(data['role']).to eql 'admin'
    end

    it 'raise an error if the key is incorrect' do
      key = OpenSSL::PKey::RSA.generate(2048)
      different_key = OpenSSL::PKey::RSA.generate(2048)
      token = jwe_certificate.encode_token(key)

      # Simulate the JWE.decrypt method raising an ArgumentError when a different key is used
      allow(JWE).to receive(:decrypt).with(token, different_key).and_raise(ArgumentError, 'Invalid key')

      result = jwe_certificate.decode_token(different_key, token)

      expect(result).to be_an_instance_of(ArgumentError)
      expect(result.message).to eq('Invalid key')
    end
  end
end
