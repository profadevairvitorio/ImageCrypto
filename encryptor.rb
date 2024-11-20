# frozen_string_literal: true

require_relative 'crypto_base'

class Encryptor < CryptoBase
  def initialize(image_path)
    super(image_path)
  end

  def encrypt(message)
    key = derive_key
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.encrypt
    cipher.key = key
    iv = cipher.random_iv

    encrypted = cipher.update(message) + cipher.final
    { iv: iv, encrypted_message: encrypted }
  end
end
