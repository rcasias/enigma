require 'minitest/autorun'
require './lib/enigma'
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

    assert_equal "hello world", enigma.descrption
    assert_equal "02715", enigma.key
    assert_equal "040895", enigma.date
  end

  def test_create_date
    enigma = Enigma.new
    enigma.encrypt("hello world", "02715", "01142021")

    month = "01"
    day = "14"
    year = "2021"

    date = (month + day + year)
    expects = ("01142021")

    assert_equal expects, enigma.date
  end

  def test_find_key
    enigma = Enigma.new
    num_1 = "01"
    num_2 = "12"
    num_3 = "23"
    num_4 = "34"
    key = (num_1 + num_2 + num_3 + num_4)

    enigma.encrypt("hello world", key, "01142021")
    assert_equal "01122334", enigma.key
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
    assert_equal nil, alphabet[28]
    assert_equal 97, alphabet_hash["a"]
    assert_equal "b", alphabet_hash.key(98)
  end

  def test_encrypt_message
    enigma = Enigma.new
    alphabet = ("a".."z").to_a << " "
    enigma.encrypt("hello world", "02715", "01142021")

    # assert_equal [], enigma.encrypt_message("hello world", "3212126")
    # assert_equal [], enigma.find_character_number
  end



end
