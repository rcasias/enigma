alphabet = ("a".."z").to_a << " "
p alphabet.reverse.

def alphabet
  alphabet = ("a".."z").to_a << " "
  alphabet.each_with_object({}) do |letter, hash|
    hash[letter] = letter.ord
  end
end
