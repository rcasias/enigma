require './lib/enigma'

class Decryptor

  def start
    print "What would you like decrypted?"
    print "> "
    @description = $stdin.gets.chomp.downcase
    print "What is your decryption code?"
    print "> "
    @code = $stdin.gets.chomp.downcase
    puts "Please wait while I decode your message!"
    sleep(2)
    create_message
  end

  def create_message
    enigma = Enigma.new
    enigma.find_key_string
    enigma.create_key_array
    enigma.your_key
    enigma.find_date_string
    enigma.create_date_array
    enigma.encrypt_array
    enigma.date
    enigma.alphabet
    enigma.decrypt_string_to_array(@code)
    enigma.decrypt_array(@code)
    enigma.decryption_cycle(@description, @code)
    enigma.alphabet_rotation_decrypt(@description, @code)
    puts "Your message translates to: #{enigma.find_number_at_letter_value(@description, @code)}!"
    # p enigma.find_number_at_letter_value(@description, @code)
  end
end
