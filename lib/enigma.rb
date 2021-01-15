# require_relative 'split'
# require_relative 'find'
require'pry'

class Enigma
  # include 'split'
  # include 'find'

  attr_reader :descrption,
              :key,
              :date

  def initialize
    @descrption = descrption
    @key        = key
    @date       = date
    # binding.pry
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
    # binding.prsy
  end

  def find_date_string
    month = Time.now.month.to_s.rjust(2, "0")
    day = Time.now.day.to_s.rjust(2, "0")
    year = (Time.now.year % 100).to_s


    part_5 = (month + day + year).to_i
    @date = (part_5 * part_5).to_s
  end




  def find_first_number
    first_number = (first_key_integer + first_date_integer)
  end

  def find_second_number
    second_number = (second_key_integer + second_date_integer)
  end

  def find_third_number
    third_number = (third_key_integer + third_date_integer)
  end

  def find_fourth_number
    fourth_number = (fourth_key_integer + fourth_date_integer)
  end

  def split_key_first
    first_key_integer = @key[0..1].to_i
  end

  def split_key_second
    second_key_integer = @key[2..3].to_i
  end

  def split_key_third
    third_key_integer = @key[4..5].to_i
  end

  def split_key_fourth
    fourth_key_integer = @key[6..7].to_i
  end

  def split_date_first
    first_date_integer = @date[-4].to_i
  end

  def split_date_second
    second_date_integer = @date[-3].to_i
  end

  def split_date_third
    third_date_integer = @date[-2].to_i
  end

  def split_date_fourth
    fourth_date_integer = @date[-1].to_i
  end

  def alphabet

    alphabet = ("a".."z").to_a << " "

  end

end
