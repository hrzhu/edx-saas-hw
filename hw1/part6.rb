class Numeric
  @@currencies = {'yen' => 0.013, 'euro' => 1.292, 'rupee' => 0.019, 'dollar' => 1}
  def method_missing(method_id)
    singular_currency = method_id.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self * @@currencies[singular_currency]
    else
      super
    end
  end

  def in(currency)
    singular_currency = currency.to_s.gsub(/s$/, '')
    if @@currencies.has_key?(singular_currency)
      self / @@currencies[singular_currency]
    end
  end
end

class String
  # YOUR CODE HERE
  def palindrome?
    downcase = self.gsub(/\W*/, '').downcase
    downcase == downcase.reverse
  end
end

module Enumerable
  # YOUR CODE HERE
  def palindrome?
    tmp_array = self.each.collect{|i| i}
    tmp_array == tmp_array.reverse
  end
end
