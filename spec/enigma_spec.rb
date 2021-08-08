require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  xit 'can encrypt a message' do
    enigma = Enigma.new

    expected = {
      :encryption => "message",
      :key => "01234",
      :date => "040321"
    }
    expect(enigma.encrypt("hello world", "01234", "040321")).to eq(expected)
  end
end
