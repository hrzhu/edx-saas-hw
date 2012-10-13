#For those just starting out, one suggested way to work on your code is to have a command window open and a text editor with this
#file loaded.  Make changes to this file and then run 'ruby part1.rb' at the command line, this will run your program.  Once you're
#satisfied with your work, save your file and upload it to the checker.


def palindrome?(str)
  # YOUR CODE HERE 
  downcase = str.gsub(/\W*/, '').downcase
  downcase == downcase.reverse
end

def count_words(str)
  # YOUR CODE HERE
  str.downcase.split(/\W+/i).inject(Hash.new(0)) {|h,v| h[v] += 1; h} 
end
