# frozen_string_literal: true

require_relative '../decryptor'

RSpec.describe Decryptor do
  subject(:decryptor) { described_class.new(image_path) }

  let(:image_path) { 'image.jpg' }
  let(:message) { 'secret message' }
  let(:fake_image_data) { 'fake_binary_data' }
  let(:secret_key) { 'test-secret' }
  let(:encrypted_data) { encryptor.encrypt(message) }
  let(:encryptor) { Encryptor.new(image_path) }

  before do
    allow(File).to receive(:read).with(image_path, mode: 'rb').and_return(fake_image_data)
    allow(ENV).to receive(:[]).with('SECRET_KEY').and_return(secret_key)
  end

  describe '#decrypt' do
    it 'returns the original message when decrypted' do
      decrypted_message = decryptor.decrypt(encrypted_data[:encrypted_message], encrypted_data[:iv])
      expect(decrypted_message).to eq(message)
    end

    it 'raises an error if the IV is incorrect' do
      wrong_iv = 'incorrect_iv'.ljust(16, '0')
      expect {
        decryptor.decrypt(encrypted_data[:encrypted_message], wrong_iv)
      }.to raise_error(OpenSSL::Cipher::CipherError)
    end
  end
end

