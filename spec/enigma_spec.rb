require './lib/enigma'

RSpec.describe Enigma do
  it 'exists' do
    enigma = Enigma.new

    expect(enigma).to be_a(Enigma)
  end

  it 'returns current date' do
    enigma = Enigma.new

    expect(enigma.todays_date.length).to eq(6)
    expect(enigma.todays_date.class).to eq(String)
  end

  it 'can encrypt a message' do
    enigma = Enigma.new

    expected = {
      encryption: "keder ohulw!",
      key: "02715",
      date: "040895"
      }

    expect(enigma.encrypt("Hello World!", "02715", "040895")).to eq(expected)
  end

  xit 'can decrypt a message' do
    enigma = Enigma.new

    expected = {
      decryption: "Hello World!",
      key: "02715",
      date: "040895"
      }

    expect(enigma.decrypt("keder ohulw!", "02715", "040895")).to eq(expected)
  end

  it 'can find index position of message characters' do
    enigma = Enigma.new
    message = "hello! world!"

    expected = [7, 4, 11, 11, 14, 26, 22, 14, 17, 11, 3]

    expect(enigma.message_index_values(message)).to eq(expected)
    end

    it 'takes index position of special characters and assigns to character' do
      enigma = Enigma.new
      message = "hello! world!"

      expected = {5 => "!", 12 => "!"}

      expect(enigma.special_characters(message)).to eq(expected)
  end

  it 'returns encrypted message as strings in array' do
    enigma = Enigma.new
    message = "hello world"
    shift = Shift.new(@key, @date)
    expected = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}

    allow(shift).to receive(:shift).and_return(expected)


    expect(enigma.encrypted_message(message, shift)).to eq(["k", "e", "d", "e", "r", " ", "o", "h", "u", "l", "w"])
  end

  it 'returns final encrypted message' do
    enigma = Enigma.new
    message = "hello! world*"
    shift = Shift.new(@key, @date)
    expected_1 = {"A" => 3, "B" => 27, "C" => 73, "D" => 20}
    allow(shift).to receive(:shift).and_return(expected_1)

    expect(enigma.final_encrypted_message(message, shift)).to eq("keder! ohulw*")
  end
end
