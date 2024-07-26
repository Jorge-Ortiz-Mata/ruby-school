# frozen_string_literal: false

require 'openssl'
require 'base64'

# It models the EncryptorTest class
class EncryptorTest
  class Error < StandardError; end
  
  attr_reader :algorithm, :key

  def initialize(algorithm, key = nil)
    @algorithm = algorithm
    @key = key
    @cipher = nil
    @iv = nil
    validate!
  end

  def encrypt(text)
    @cipher.encrypt
    @cipher.key = @key
    @cipher.iv = @iv
    text_encrypted = @cipher.update(text) + @cipher.final
    { iv: Base64.encode64(@iv), text_encrypted: Base64.encode64(text_encrypted) }
  end

  def decrypt(data)
    @cipher.decrypt
    @cipher.key = @key
    @cipher.iv = Base64.decode64(data[:iv])
    encrypted_text = Base64.decode64(data[:text_encrypted])
    @cipher.update(encrypted_text) + @cipher.final
  end

  private

  def validate!
    algorithms = OpenSSL::Cipher.ciphers

    raise Error, 'wrong algorithm set' unless algorithms.include? @algorithm
    
    set_cipher
    set_key
    validate_key
    set_iv
  end
  
  def validate_key
    raise Error, 'wrong key set' unless @key.bytesize.eql? @cipher.key_len
  end

  def set_cipher
    @cipher ||= OpenSSL::Cipher.new(@algorithm)
  end

  def set_key
    @key ||= @cipher.random_key
  end

  def set_iv
    @iv ||= @cipher.random_iv
  end
end
