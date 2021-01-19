require './lib/enigma'

class Encryptor
  # attr_reader :description
  #
  # def initialize
  #   @description = description
  # end

  def start
    print "What would you like encrypted?"
    print "> "
    @description = $stdin.gets.chomp.downcase
    print "Please wait while I create your random encryption code!"
    sleep(2)
    create_code
  end

  def create_code
    enigma = Enigma.new
    enigma.find_key_string
    enigma.create_key_array
    p enigma.your_key
    enigma.find_date_string
    enigma.create_date_array
    enigma.encrypt_array
    p enigma.date


    enigma.alphabet
    @description
    enigma.encryption_cycle(@description)
    enigma.alphabet_numbers
    enigma.alphabet_rotation
    enigma.alphabet_rotation_encrypt(@description)
    p enigma.find_letter_at_number_key(@description)
  end
end
