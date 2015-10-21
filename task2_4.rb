def combine_anagrams(words)
  cp = 0
  hash = Hash.new []
  words.each do |word|
    cp += 1
    (cp..words.count).each do |i|
      hash[word.to_s.chars.sort.join] += [word]
    end
    hash[word.to_s.chars.sort.join] = hash[word.to_s.chars.sort.join].uniq
  end
  hash
end