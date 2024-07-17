# spec/jwt_certificate_spec.rb
require 'spec_helper'
require_relative '../../classes/jwt_certificate'

RSpec.describe JwtCertificate do
  let(:jwt_certificate) { build(:jwt_certificate) }

  describe 'public methods' do
    it 'encodes the payload' do
      key = 'someDummyKey123'
      algorithm = 'HS256'
      token_encoded = jwt_certificate.encode_token(key, algorithm)

      expect(token_encoded).to include 'ey'
    end

    # it 'decodes the token correctly' do
    #   key = 'someDummyKey123'
    #   algorithm = 'HS256'
    #   token_encoded = jwt_certificate.encode_token(key, algorithm)
    #   payload = jwt_certificate.decode_token(token_encoded, key, algorithm)

    #   data = payload[0]
    #   algorithm_applied = payload[1]

    #   expect(data['id']).to eql 1
    #   expect(data['name']).to eql 'Jorge'
    #   expect(data['role']).to eql 'admin'
    #   expect(algorithm_applied['alg']).to eql algorithm
    # end

    # it 'raise an error if the key is incorrect' do
    #   key_one = 'someDummyKey123'
    #   key_two = 'someDummyKey1234'
    #   algorithm = 'HS256'
    #   token_encoded = jwt_certificate.encode_token(key_one, algorithm)
    #   allow(JWT).to receive(:decrypt).with(token_encoded, key_two, algorithm).and_raise(ArgumentError, 'Invalid key')

    #   result = jwt_certificate.decode_token(token_encoded, key_two, algorithm)

    #   expect(result).to be_an_instance_of(JWT::VerificationError)
    #   expect(result.message).to eq('Signature verification failed')
    # end
  end
end
