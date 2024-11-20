# frozen_string_literal: true

require_relative '../encryptor'

RSpec.describe Encryptor do
  subject(:encryptor) { described_class.new(image_path) }

  let(:image_path) { 'image.jpg' }
  let(:message) { 'secret message' }
  let(:fake_image_data) { 'fake_binary_data' }
  let(:secret_key) { 'test-secret' }

  before do
    allow(File).to receive(:read).with(image_path, mode: 'rb').and_return(fake_image_data)
    allow(ENV).to receive(:[]).with('SECRET_KEY').and_return(secret_key)
  end

  describe '#encrypt' do
    it 'returns an encrypted message and an IV' do
      result = encryptor.encrypt(message)
      expect(result).to have_key(:iv)
      expect(result).to have_key(:encrypted_message)
    end

    it 'generates a unique IV for each encryption' do
      first_result = encryptor.encrypt(message)
      second_result = encryptor.encrypt(message)
      expect(first_result[:iv]).not_to eq(second_result[:iv])
    end
  end
end
