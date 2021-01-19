require './lib/enigma'

class Encryptor

  def start
    print "What would you like to encrypt?"
    print "> "
    @description = $stdin.gets.chomp.downcase
    puts "Please wait while I create your random encryption code!"
    sleep(2)
    create_code
  end

  def create_code
    enigma = Enigma.new
    enigma.find_key_string
    enigma.create_key_array
    puts "Your decryption code is: #{enigma.your_key}"
    puts "Please save this code for reference!"
    enigma.find_date_string
    enigma.create_date_array
    enigma.encrypt_array
    enigma.date
    enigma.alphabet
    enigma.encryption_cycle(@description)
    enigma.alphabet_numbers
    enigma.alphabet_rotation
    enigma.alphabet_rotation_encrypt(@description)
    puts "Your encrypted message is: #{enigma.find_letter_at_number_key(@description)}"
  end
end
