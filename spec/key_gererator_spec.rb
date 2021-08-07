require './spec_helper'
require './lib/key_generator'
require 'pry'

RSpec.describe KeyGenerator do
  it 'exists' do
    key = KeyGenerator.new

    expect(key).to be_a(KeyGenerator)
  end
end
