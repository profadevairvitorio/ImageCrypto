# frozen_string_literal: true

require_relative '../crypto_base'

RSpec.describe CryptoBase do
  subject(:crypto_base) { described_class.new(image_path) }

  let(:image_path) { 'image.jpg' }
  let(:fake_image_data) { 'fake_binary_data' }
  let(:secret_key) { 'test-secret' }

  before do
    allow(File).to receive(:read).with(image_path, mode: 'rb').and_return(fake_image_data)
    allow(ENV).to receive(:[]).with('SECRET_KEY').and_return(secret_key)
  end

  describe '#derive_key' do
    it 'returns a 256-bit key' do
      key = crypto_base.derive_key
      expect(key.bytesize).to eq(32)
    end

    it 'combines image data and the secret key to generate the key' do
      expected_key = Digest::SHA256.digest(fake_image_data + secret_key)
      expect(crypto_base.derive_key).to eq(expected_key)
    end
  end
end
