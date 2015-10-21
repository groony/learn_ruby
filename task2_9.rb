class String
  def palindrome?
    letters = self.downcase.scan(/\w/)
    letters == letters.reverse
  end
end

module Enumerable
  def palindrome?
    a = to_a
    a == a.reverse
  end
end