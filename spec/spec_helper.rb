# frozen_string_literal: true

require 'dotenv/load'
require 'rspec'

RSpec.configure do |config|
  config.color = true
  config.formatter = :documentation
end