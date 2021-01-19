require './lib/enigma'

class Encryptor

  def start
    print "What would you like encrypted?"
    print "> "
    description = $stdin.gets.chomp.downcase
    print "Please wait while I create your random encryption code!"
    sleep(2)
    create_code(description)
  end

  def create_code(description)
    enigma = Enigma.new
    enigma.find_key_string
    enigma.create_key_array
    p enigma.your_key
    enigma.find_date_string
    enigma.create_date_array
    enigma.encrypt_array
    p enigma.date
  end
end
