require 'minitest/autorun'
require './lib/enigma'
require 'date'
# require "minitest/mocha"
# require './lib/split'
# require './lib/find'


class EnigmaTest < Minitest::Test

  def test_it_exists
    enigma = Enigma.new

    assert_instance_of Enigma, enigma
  end

  def test_it_has_attributes
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")

    description = "hello world"
    key = "02715"
    date = "040895"

    assert_equal "hello world", description
    assert_equal "02715", key
    assert_equal "040895", date
  end

  def test_create_date
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "040895")

    month = "04"
    day = "08"
    year = "95"

    date = (month + day + year)
    expects = ("040895")

    assert_equal expects, date
  end

  def test_find_key
    enigma = Enigma.new
    num_1 = "01"
    num_2 = "12"
    num_3 = "23"
    num_4 = "34"
    key = (num_1 + num_2 + num_3 + num_4)

    assert_equal "01122334", key
  end

  def test_alphabet
    alphabet = ("a".."z").to_a << " "

    alphabet_hash = {
                      "a" => 97,
                      "b" => 98
    }

    assert_equal 27, alphabet.length
    assert_equal "b", alphabet[1]
    assert_equal 97, alphabet[0].ord
    assert_equal 102, alphabet[5].ord
    assert_nil   alphabet[28]
    assert_equal 97, alphabet_hash["a"]
    assert_equal "b", alphabet_hash.key(98)
  end

  def test_encryption_cycle
    enigma = Enigma.new
    alphabet = ("a".."z").to_a << " "
    enigma.encrypt("hello world", "02715", "01142021")

    assert_equal 7, enigma.encryption_cycle("hello world")[0][0]
    assert_equal 4, enigma.encryption_cycle("hello world")[1][0]
    assert_equal 11, enigma.encryption_cycle("hello world")[2][0]
    assert_equal 11, enigma.encryption_cycle("hello world")[3][0]
    assert_equal 14, enigma.encryption_cycle("hello world")[4][0]
  end

  def test_alphabet_hash
    enigma = Enigma.new
    alphabet = ("a".."z").to_a << " "
    enigma.encrypt("hello world", "02715", "01142021")
    expect = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26]

    assert_equal expect, enigma.alphabet_numbers
  end

  def test_alphabet_hash
    enigma = Enigma.new
    alphabet = ("a".."z").to_a << " "
    enigma.encrypt("hello world", "02715", "01142021")
    expect = [{0=>"a", 1=>"b", 2=>"c", 3=>"d", 4=>"e", 5=>"f", 6=>"g", 7=>"h",
              8=>"i", 9=>"j", 10=>"k", 11=>"l", 12=>"m", 13=>"n", 14=>"o", 15=>"p",
              16=>"q", 17=>"r", 18=>"s", 19=>"t", 20=>"u", 21=>"v", 22=>"w", 23=>"x", 24=>"y",
              25=>"z", 26=>" "}]

    assert_equal expect, enigma.alphabet_rotation
    assert_equal "a", enigma.alphabet_rotation[0][0]
    assert_nil enigma.alphabet_rotation[0][27]
    assert_equal 20, enigma.alphabet_rotation[0].key("u")
    assert_nil enigma.alphabet_rotation[0].key("!")
  end

  def test_alphabet_hash
    enigma = Enigma.new
    alphabet = ("a".."z").to_a << " "
    enigma.encrypt("hello world", "02715", "01142021")
    expect = [11, 21, 18, 12, 18, 16, 2, 15, 21, 1, 10]

    assert_equal expect, enigma.alphabet_rotation_encrypt("hello world")
  end

  def test_find_letter_at_number_key
    enigma = Enigma.new
    alphabet = ("a".."z").to_a << " "
    enigma.encrypt("hello world", "02715", "01142021")

    assert_equal "lvsmsqcpvbk", enigma.find_letter_at_number_key("hello world")
  end

  def test_decrypt_string_to_array
    enigma = Enigma.new

    assert_equal ["2", "7", "1", "5"], enigma.decrypt_string_to_array("02715")
  end

  def test_create_key_array_for_decoder
    enigma = Enigma.new

    assert_equal [2,27,71,15], enigma.create_key_array_for_decoder("02715")
  end

  # def test_decrypt_number_array
  #   enigma = Enigma.new
  #
  #   assert_equal [], enigma.decrypt_number_array("02715")
  # end

  # def test_decrypt_array
  #   enigma = Enigma.new
  #
  #   assert_equal [-2,-27,-71,-15], enigma.decrypt_array("02715")
  # end

  # def test_decryption_cycle(encrypted_message, string)
  #   enigma = Enigma.new
  #
  #   assert_equal [], enigma.decryption_cycle("hello world", "02715")
  # end


end
