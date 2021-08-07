require './lib/key_generator'
require './spec_helper'
require 'pry'

RSpec.describe KeyGenerator do
  it 'exists' do
    new_key = KeyGenerator.new

    expect(new_key).to be_a(KeyGenerator)
  end

  it 'can generate random key' do

    expect(KeyGenerator.key.length).to eq(5)
    expect(KeyGenerator.key.class).to eq(String)
  end
end
