module Enumerable
  # Your code goes here
  def my_each_with_index
    i = 0
    while i < length
      yield(self[i], i)
      i += 1
    end
    self
  end

  def my_select
    i = 0
    selection = []
    while i < length
      selection << self[i] if yield(self[i]) == true
      i += 1
    end
    selection
  end

  def my_all?
    i = 0
    while i < length
      return false if yield(self[i]) == false
      i += 1
    end
    true
  end

  def my_any?
    i = 0
    while i < length
      return true if yield(self[i]) == true
      i += 1
    end
    false
  end

  def my_none?
    i = 0
    while i < length
      return false if yield(self[i]) == true
      i += 1
    end
    true
  end

  def my_count
    return length unless block_given?

    i = 0
    count = 0
    while i < length
      count += 1 if yield(self[i]) == true
      i += 1
    end
    count
  end

  def my_map
    arr = []
    i = 0
    while i < length
      arr << yield(self[i])
      i += 1
    end
    arr
  end

  def my_inject(initial_value)
    result = initial_value
    i = 0
    while i < length
      result = yield(result, self[i])
      i += 1
    end
    result
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    while i < length
      yield(self[i])
      i += 1
    end
    self
  end
end
