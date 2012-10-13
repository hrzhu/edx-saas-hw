class CartesianProduct
  include Enumerable
  # YOUR CODE HERE

  def initialize(x, y)
    @x, @y = x, y
  end

  def each
    @x.each do |i|
      @y.each do |j|
        yield [i,j]
      end
    end
  end
end
