# frozen_string_literal: false

require 'jwt'

# It models the JWECertificate class
class JwtCertificate
  def initialize(payload)
    @payload = payload
  end

  def encode_token(key, algorithm)
    JWT.encode(@payload, key, algorithm)
  end

  def decode_token(token, key, algorithm)
    # JWE.decrypt(token, key)
    JWT.decode(token, key, algorithm)
  rescue => e
    e
  end
end
