# frozen_string_literal: true

require_relative 'encryptor'
require_relative 'decryptor'

image_path = 'foo.jpg'

message = 'Foo Bar'

encryptor = Encryptor.new(image_path)
encrypted_data = encryptor.encrypt(message)
puts "Mensagem criptografada: #{encrypted_data[:encrypted_message].inspect}"

decryptor = Decryptor.new(image_path)
decrypted_message = decryptor.decrypt(encrypted_data[:encrypted_message], encrypted_data[:iv])
puts "Mensagem descriptografada: #{decrypted_message}"