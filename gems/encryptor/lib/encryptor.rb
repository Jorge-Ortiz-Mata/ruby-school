class Encryptor
  class Error < StandardError; end

  attr_reader :key, :algorithm

  def initialize(algorithm)
    @algorithm = algorithm
    @key = key
    validate!
  end

  def encrypt(text)
  end

  def decrypt(text)
  end

  def configure
    @key = 'random'
    @algorithm = 'random'
  end

  def generate_key
    'random'
  end

  def generate_iv
    'random'
  end

  private

  def validate!
    algorithms = OpenSSL::Cipher.ciphers

    raise Error, 'wrong algorithm set' unless algorithms.include? @algorithm
  end
end