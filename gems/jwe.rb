require 'jwe'

class MyErrors < StandardError; end

key = OpenSSL::PKey::RSA.generate(2048)

payload = {
  id: 1,
  name: 'Jorge',
  role: 'admin'
}

def encode_token(key, payload)
  JWE.encrypt(payload.to_json, key)
end

def decode_token(key, encrypted_token)
  JWE.decrypt(encrypted_token, key)

  # raise MyErrors, 'The key is empty or it was not specified' if key.nil?
rescue ArgumentError => e
  e
end

token = encode_token(key, payload)
puts decode_token(nil, token)
