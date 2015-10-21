def count_words(str)
  r = Hash.new(0)
  words = str.downcase.scan(/\w+/)
  words.each { |word|  r[word] += 1 }
  r
end