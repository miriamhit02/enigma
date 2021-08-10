require './lib/enigma'

enigma = Enigma.new

handle = File.open(ARGV[0], "r")

message = handle.read

writer = File.open(ARGV[1], "w")

result = enigma.encrypt(message)

writer.write(result[:encryption])

p "Created #{ARGV[1]} with the key #{result[:key]} and date #{result[:date]}"

writer.close
