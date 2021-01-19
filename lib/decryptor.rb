require './lib/enigma'

class Decryptor

  def start
    print "What would you like decrypted?"
    print "> "
    @description = $stdin.gets.chomp.downcase
    print "What is your decryption code?"
    print "> "
    @code = $stdin.gets.chomp.downcase
    print "Please wait while I decode you message!"
    sleep(2)
    create_message
  end

  def create_message
    enigma = Enigma.new
    enigma.find_key_string
    p enigma.create_key_array
    p enigma.your_key
    enigma.find_date_string
    p enigma.create_date_array
    p enigma.encrypt_array
    enigma.date

    enigma.alphabet
    p @description
    p @code

    # p enigma.alphabet_numbers
    # p enigma.alphabet_rotation
    p enigma.decrypt_string_to_array(@code)
    p enigma.decrypt_array(@code)
    p enigma.decryption_cycle(@description, @code)
    p enigma.alphabet_rotation_decrypt(@description, @code)
    p enigma.find_number_at_letter_value(@description, @code)
  end
end
