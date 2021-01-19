alphabet = ("a".."z").to_a << " "
p alphabet.reverse.

def alphabet
  alphabet = ("a".."z").to_a << " "
  alphabet.each_with_object({}) do |letter, hash|
    hash[letter] = letter.ord
  end
end


def alphabet_rotation
  alphabet_hashes = []
  # encrypt_array.each do |num|
  #   alphabet_hashes << alphabet.zip(alphabet.rotate(num)).to_h
  # end
  alphabet.each do |letter|
    alphabet_hashes << alphabet.zip
  alphabet_hashes
end

def translate
  encrypt_array
end

@descrption.zip(encrypt_array.cycle).map(&:sum)
a.zip(encrypt_array.cycle).map(&:sum)

def translate_message_into_numbers(message)
  message = @descrption
  translation_array = []
  message.each_char do |letter|
    result = (letter.ord + encrypt_array[0])
    translation_array <<  result
    encrypt_array.rotate
  end
  binding.pry
end

def move_numbers_by_rotation(rot)

def encrypt_message(description, encryption_numbers)
  descrption = @descrption
  encryption_numbers = encrypt_array
  descrption.downcase
  # number = number.to_i
  new_message = []
  encryption_numbers.each do |number|
    array = []
    descrption.each_char do |letter|
      result = letter.ord
      result += number
      new_result = result.chr
      array.push(new_result)
    end
    array
    new_message = array
  end
  new_message
end

def encryption_cycle
  letter_array = []
  @descrption.each_char do |letter|
    letter_array << (letter.ord - 97)
  end
  letter_array.zip(encrypt_array.cycle)
end
