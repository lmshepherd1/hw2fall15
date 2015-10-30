class CartesianProduct
  include Enumerable

  def initialize(sequence1, sequence2)
    # if sequence1.class is iterable and sequence2.class is iterable
    if sequence1.respond_to? :each and sequence2.respond_to? :each
      # determine whether each index is the correct format
      @sequence1 = sequence1
      @sequence2 = sequence2
    else
      raise ArgumentError.new("Invalid parameters")
    end
  end
  
  def each
    # iterate through first sequence
    @sequence1.each do |x| 
      # nested second sequence and yield
      @sequence2.each { |y| yield [x, y] }
    end
  end
end