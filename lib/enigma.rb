# require './lib/split'
# require './lib/find'

require'pry'

class Enigma
  # include Split
  # include Find

  attr_reader :descrption,
              :key,
              :date

  def initialize
    @descrption = "Test"
    @key        = key
    @date       = date
  end

  def encrypt(descrption, key, date)
    @descrption = descrption
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

  def find_date_string
    month = Time.now.month.to_s.rjust(2, "0")
    day = Time.now.day.to_s.rjust(2, "0")
    year = (Time.now.year % 100).to_s
    part_5 = (month + day + year).to_i
    @date = (part_5 * part_5).to_s
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
    # alphabet_hash = alphabet.each_with_object({}) do |letter, hash|
    #   hash[letter] = letter.ord
    # end
    # alphabet_numbers = []
    # alphabet.each do |letter|
    #   alphabet_numbers << (letter.ord - 97)
    # end
    # alphabet_numbers
  end

  def encryption_cycle
    letter_array = []
    @descrption.each_char do |letter|
      letter_array << (letter.ord - 97)
    end
    letter_array.zip(encrypt_array.cycle)
    #[["h", 4], ["e", 71], ["l", 7], ["l", 1], ["o", 4], [" ", 71], ["w", 7], ["o", 1], ["r", 4], ["l", 71], ["d", 7]]
  end

  def alphabet_numbers
    alphabet_number_array = []
    alphabet.each do |letter|
      alphabet_number_array << (letter.ord - 97)
    end
    alphabet_number_array
  end

  def alphabet_rotation
    alphabet_hash = []
      alphabet_hash << alphabet_numbers.zip(alphabet).to_h
    alphabet_hash
  end

  def alphabet_rotation_encrypt
    new_alphabet = []

    # binding.pry
    encryption_cycle.each do |num|

      new_alphabet << alphabet_numbers.rotate(num[0]).rotate(num[1])[0]
    end
    #this method moves a over [4,71,7,1] spaces
    binding.pry
  end

  def find_letter_at_number_key
    new_message = []
    new_alphabet.each do |number|
      new_message << alphabet_rotation[0][number]
    end
    new_message.join
  end
end
