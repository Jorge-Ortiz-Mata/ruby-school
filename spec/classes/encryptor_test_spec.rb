# spec/car_spec.rb
require 'spec_helper'
require_relative '../../classes/encryptor_test'

RSpec.describe EncryptorTest do
  let(:encryptor_test) { build(:encryptor_test) }

  describe '#instances' do
    it 'should initialize with an incorrect algorithm' do
      expect { EncryptorTest.new('invalid_algorithm') }.to raise_error(EncryptorTest::Error, 'wrong algorithm set')
    end

    it 'should initialize with an incorrect key' do
      expect { EncryptorTest.new('aes-128-cbc', 'dummy-key') }.to raise_error(EncryptorTest::Error, 'wrong key set')
    end

    it 'should initialize correctly with only the algorithm' do
      expect { EncryptorTest.new('aes-128-cbc') }.to_not raise_error(EncryptorTest::Error, 'wrong algorithm set')
      expect { EncryptorTest.new('aes-128-cbc') }.to_not raise_error(EncryptorTest::Error, 'wrong key set')
    end

    it 'should initialize correctly with the algorithm and the key' do
      algorithm = 'aes-128-cbc'
      cipher = OpenSSL::Cipher.new(algorithm)

      expect { EncryptorTest.new(algorithm, cipher.random_key) }.to_not raise_error(EncryptorTest::Error, 'wrong algorithm set')
      expect { EncryptorTest.new(algorithm, cipher.random_key) }.to_not raise_error(EncryptorTest::Error, 'wrong key set')
    end
    
    it 'should initialize correctly the factory bot instance' do
      expect(encryptor_test.algorithm).to_not be_nil
      expect(encryptor_test.key).to_not be_nil
    end
  end

  describe 'public methods' do
    it 'should encrypt a text' do
      text_to_encrypt = 'Hola Jorge this is your private key: SOMEKEY123'
      response = encryptor_test.encrypt(text_to_encrypt)

      expect(response[:iv]).to_not be_nil
      expect(response[:text_encrypted]).to_not eql text_to_encrypt
    end

    it 'should the decrypt a text' do
      text_to_encrypt = 'Hola Jorge this is your private key: SOMEKEY123'
      response = encryptor_test.encrypt text_to_encrypt
      text_decrypted = encryptor_test.decrypt(response)

      expect(text_decrypted).to eql text_to_encrypt
    end
  end
end
