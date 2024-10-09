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

  def my_all?(&condition)
    all_match = true

    my_each do |item|
      unless condition.call(item)
        all_match = false
        break
      end
    end

    all_match
  end

  def my_any?(&condition)
    any_match = false

    my_each do |item|
      if condition.call(item)
        any_match = true
        break
      end
    end

    any_match
  end

  def my_none?(&condition)
    !my_any?(&condition)
  end

  def my_count
    return length unless block_given?

    count = 0
    my_each do |item|
      count += 1 if yield(item)
    end

    count
  end

  def my_map(&block)
    result = []

    my_each { |item| result.push(block.call(item)) }

    result
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
