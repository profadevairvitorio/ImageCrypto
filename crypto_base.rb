# frozen_string_literal: true

require 'openssl'
require 'digest'
require 'base64'
require 'dotenv/load'

class CryptoBase
  def initialize(image_path)
    @image_path = image_path
    @secret_key = ENV['SECRET_KEY']
  end

  def derive_key
    image_data = File.read(@image_path, mode: 'rb')
    image_base64 = Base64.strict_encode64(image_data)
    combined = image_base64 + @secret_key
    Digest::SHA256.digest(combined)
  end
end
