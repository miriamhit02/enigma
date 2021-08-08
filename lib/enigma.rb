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

  end
end
