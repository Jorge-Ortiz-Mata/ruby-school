# frozen_string_literal: false

require 'jwe'

# It models the JWECertificate class
class JweCertificate
  def initialize(payload)
    @payload = payload
  end

  def encode_token(key)
    JWE.encrypt(@payload.to_json, key)
  end

  def decode_token(key, token)
    JWE.decrypt(token, key)
  rescue ArgumentError => e
    e
  end
end
