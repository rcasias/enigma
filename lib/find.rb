require './lib/split'

module Find
  include Split

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

end
