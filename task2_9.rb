# String
class String
  def palindrome?
    letters = downcase.scan(/\w/)
    letters == letters.reverse
  end
end

# Enumerable
module Enumerable
  def palindrome?
    a = to_a
    a == a.reverse
  end
end
