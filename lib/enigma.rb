require 'date'
require './lib/key_generator'

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

  def message_index_values(message)
      message_values = []
      message.each_char do |charact|
        # binding.pry
        unless @alphabet.index(charact).nil?
          message_values << @alphabet.index(charact)
        end
      end
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
        var = shift.shift["A"]
        @alphabet.rotate(var)[number]
      elsif (index +1) % 4 == 2
        var = shift.shift["B"]
        @alphabet.rotate(var)[number]
      elsif (index + 1) % 4 == 3
        var = shift.shift["C"]
        @alphabet.rotate(var)[number]
      elsif (index + 1) % 4 == 0
        var = shift.shift["D"]
        @alphabet.rotate(var)[number]
      end
    end
  end


  def final_encrypted_message(message, shift)
    encrypted_message = encrypted_message(message, shift)
    special_characters(message).each do |index, spec_char|
      encrypted_message.insert(index, spec_char)
    end
    encrypted_message.join
  end
end
