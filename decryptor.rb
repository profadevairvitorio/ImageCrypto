# frozen_string_literal: true

require_relative 'crypto_base'

class Decryptor < CryptoBase
  def initialize(image_path)
    super(image_path)
  end

  def decrypt(encrypted_message, iv)
    key = derive_key
    cipher = OpenSSL::Cipher.new('AES-256-CBC')
    cipher.decrypt
    cipher.key = key
    cipher.iv = iv

    decrypted = cipher.update(encrypted_message) + cipher.final
    decrypted
  end
end
