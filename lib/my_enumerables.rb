module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      i = 0
      while i < length
        yield at(i), i
        i += 1
      end
    end

    self
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each(&block)
    if block_given?
      i = 0
      while i < length
        block.call(at(i))
        i += 1
      end
    end

    self
  end
end
