def palindrome?(string)
  letters = string.downcase.scan(/\w/)
  letters == letters.reverse
end