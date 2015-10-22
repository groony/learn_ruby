def count_words(str)
  result = Hash.new(0)
  str.downcase.scan(/\w+/).each { |word| result[word] += 1 }
  result
end
