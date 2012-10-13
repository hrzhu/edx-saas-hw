def combine_anagrams(words)
 # YOUR CODE HERE
    words_hash = words.each_with_object(Hash.new([])) do |word, hash|
          hash[word.downcase.chars.sort] += [word]
    end
    words_hash.values
end
