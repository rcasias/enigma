require './lib/find'

module Split
  include Find

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
end
