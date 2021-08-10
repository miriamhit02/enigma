require 'date'
require './lib/key_generator'
require './lib/shift'

class Enigma

  def initialize
    @alphabet = ("a".."z").to_a << " "
  end

  def todays_date
   Date.today.strftime("%d%m%y")
  end

  def encrypt(message, key = nil, date = nil)
    # binding.pry
    message = message.downcase
    key = key || KeyGenerator.key
    date = date || todays_date
    shift = Shift.new(key, date)
    # returns hash
    encrypted = {
      encryption: final_encrypted_message(message, shift),
      key: key,
      date: date
      }
  end

  def decrypt(message, key, date=nil)
    message = message.downcase
    key = key || KeyGenerator.random_key
    date = date || todays_date
    shift = Shift.new(key, date)
    decrypted = {
      decryption: final_decrypted_message(message, shift),
      key: key,
      date: date
      }
  end

  def message_index_values(message)
    message_values = []
    message.each_char do |char|
      unless @alphabet.index(char).nil?
        message_values << @alphabet.index(char)
      end
    end
      # binding.pry
    message_values
  end

  def special_characters(message)
    special = {}
    message.each_char.with_index do |char, index|
      if @alphabet.index(char).nil?
        special[index] = char
      end
    end
    special
  end

  def encrypted_message(message, shift)
    message_index_values(message).map.with_index do |number, index|
      if (index + 1) % 4 == 1
        num = shift.shift["A"]
        @alphabet.rotate(num)[number]
      elsif (index +1) % 4 == 2
        num = shift.shift["B"]
        @alphabet.rotate(num)[number]
      elsif (index + 1) % 4 == 3
        num = shift.shift["C"]
        @alphabet.rotate(num)[number]
      elsif (index + 1) % 4 == 0
        num = shift.shift["D"]
        @alphabet.rotate(num)[number]
      end
    end
  end

  def decrypted_message(message, shift)
    message_index_values(message).map.with_index do |number, index|
      if (index + 1) % 4 == 1
        num = shift.shift["A"]
        @alphabet.rotate(-num)[number]
      elsif (index +1) % 4 == 2
        num = shift.shift["B"]
        @alphabet.rotate(- num)[number]
      elsif (index + 1) % 4 == 3
        num = shift.shift["C"]
        @alphabet.rotate(- num)[number]
      elsif (index + 1) % 4 == 0
        num = shift.shift["D"]
        @alphabet.rotate(- num)[number]
      end
      # binding.pry
    end
  end

  def final_encrypted_message(message, shift)
    encrypted_message = encrypted_message(message, shift)
    special_characters(message).each do |index, special|
      encrypted_message.insert(index, special)
    end
    encrypted_message.join
  end


  def final_decrypted_message(message, shift)
    decrypted = decrypted_message(message, shift)
    special_characters(message).each do |index, special|
      decrypted.insert(index, special)
    end
    decrypted.join
  end
end
