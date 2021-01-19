require'pry'

class Enigma

  attr_reader :descrption,
              :key,
              :date

  def encrypt(descrption, key, date)
    @description = descrption
    @key = key
    @date = date
  end

  def find_key_string
    number_2 = rand(0..9).to_s
    number_3 = rand(0..9).to_s
    number_4 = rand(0..9).to_s
    number_5 = rand(0..9).to_s

    part_2 = ('0' + number_2)
    part_3 = (number_2 + number_3)
    part_4 = (number_3 + number_4)
    part_5 = (number_4 + number_5)

    @key = (part_2 + part_3 + part_4 + part_5)
  end

  def create_key_array
    key_array = []
    key_array << @key[0..1].to_i
    key_array << @key[2..3].to_i
    key_array << @key[4..5].to_i
    key_array << @key[6..7].to_i
  end

  def your_key
    your_key = []
    your_key << create_key_array[0..1]
    your_key << create_key_array[3]
    your_key << create_key_array[5]
    your_key << create_key_array[7]
    your_key.join.to_s.rjust(5, '0')
  end

  def find_date_string
    month = Time.now.month.to_s.rjust(2, "0")
    day = Time.now.day.to_s.rjust(2, "0")
    year = (Time.now.year % 100).to_s
    part_5 = (month + day + year).to_i
    @date = (part_5 * part_5).to_s
  end

  def date
    month = Time.now.month.to_s.rjust(2, "0")
    day = Time.now.day.to_s.rjust(2, "0")
    year = (Time.now.year % 100).to_s
    part_5 = (month + day + year)
  end

  def create_date_array
    date_arary = []
    date_arary << @date[-4].to_i
    date_arary << @date[-3].to_i
    date_arary << @date[-2].to_i
    date_arary << @date[-1].to_i
  end

  def encrypt_array
    encrypt_numbers = []
    encrypt_numbers << create_key_array[0] + create_date_array[0]
    encrypt_numbers << create_key_array[1] + create_date_array[1]
    encrypt_numbers << create_key_array[2] + create_date_array[2]
    encrypt_numbers << create_key_array[3] + create_date_array[3]
  end

  def alphabet
    alphabet = ("a".."z").to_a << " "
  end

  def encryption_cycle(message)
    # message = @description
    letter_array = []
    message.each_char do |letter|
    	if letter == " "
    	  letter_array << 26
      else
        letter_array << (letter.ord - 97)
      end
    end
    letter_array.zip(encrypt_array.cycle)
  end

  def alphabet_numbers
    alphabet_number_array = []
    alphabet.each do |letter|
      if letter == " "
    	  alphabet_number_array << 26
      else
        alphabet_number_array << (letter.ord - 97)
      end
    end
    alphabet_number_array
  end

  def alphabet_rotation
    alphabet_hash = []
      alphabet_hash << alphabet_numbers.zip(alphabet).to_h
    alphabet_hash
  end

  def alphabet_rotation_encrypt(message)
    new_alphabet = []
    encryption_cycle(message).each do |num|
      new_alphabet << alphabet_numbers.rotate(num[0]).rotate(num[1])[0]
    end
    new_alphabet
  end

  def find_letter_at_number_key(message)
    new_message = []
    alphabet_rotation_encrypt(message).each do |number|
      new_message << alphabet_rotation[0][number]
    end
    new_message.join
    # binding.pry
  end



  #
  # def decrypt_word
  #   word = "lvsmsqcpvbk"
  # end

  # def decrypt_array
  #   decrypt_array = []
  #   encrypt_array.each do |num|
  #     decrypt_array << (num * -1)
  #   end
  #   decrypt_array
  # end


  def decrypt_string_to_array(string)
    key_array = []
    key_array << (string.to_s[1])
    key_array << (string.to_s[2])
    key_array << (string.to_s[3])
    key_array << (string.to_s[4])
    key_array
  end

  def create_key_array_for_decoder(string)
    new_array = []
    new_array << (decrypt_string_to_array(string)[0]).to_i
    new_array << (decrypt_string_to_array(string)[0] + decrypt_string_to_array(string)[1]).to_i
    new_array << (decrypt_string_to_array(string)[1] + decrypt_string_to_array(string)[2]).to_i
    new_array << (decrypt_string_to_array(string)[2] + decrypt_string_to_array(string)[3]).to_i
    new_array
    # binding.pry
  end

  def decrypt_number_array(string)
    decrypt_numbers = []
    decrypt_numbers << create_key_array_for_decoder(string)[0] + create_date_array[0]
    decrypt_numbers << create_key_array_for_decoder(string)[1] + create_date_array[1]
    decrypt_numbers << create_key_array_for_decoder(string)[2] + create_date_array[2]
    decrypt_numbers << create_key_array_for_decoder(string)[3] + create_date_array[3]
    decrypt_numbers
    # binding.pry
  end

  def decrypt_array(string)
    decrypt_array = []
    decrypt_number_array(string).each do |num|
      decrypt_array << (num * -1)
    end
    decrypt_array
  end

  def decryption_cycle(encrypted_message, string)
    letter_array = []
    encrypted_message.each_char do |letter|
    	if letter == " "
    	  letter_array << 26
      else
        letter_array << (letter.ord - 97)
      end
    end
    letter_array.zip(decrypt_array(string).cycle)
  end

  def alphabet_rotation_decrypt(encrypted_message, string)
    new_alphabet = []
    decryption_cycle(encrypted_message, string).each do |num|
      new_alphabet << alphabet_numbers.rotate(num[0]).rotate(num[1])[0]
    end
    new_alphabet
  end

  def find_number_at_letter_value(encrypted_message, string)
    new_message = []
    alphabet_rotation_decrypt(encrypted_message, string).each do |number|
      new_message << alphabet_rotation[0][number]
    end
    new_message.join
    # binding.pry
  end

end
