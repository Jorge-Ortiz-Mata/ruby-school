# frozen_string_literal: true

require 'jwt'

payload_dummy = { id: 'uid-ah38-aj289-smf8', first_name: 'Jorge', last_name: 'Ortiz', age: 25 }

secret_key = '28934u9enakjds_sdfniuu3_sufnu3nJN'

def generate_token(secret_key, payload)
  JWT.encode(payload, secret_key, 'HS256')
end

def decode_token(token, secret_key)
  JWT.decode(token, secret_key, 'HS256')
rescue JWT::VerificationError # JWT Verification Error regarding the secret_key
  'The secret key is invalid and can not decoded the access token properly'
end

encoded_token = generate_token(secret_key, payload_dummy)
response = decode_token(encoded_token, secret_key)

puts response
