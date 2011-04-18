class Object
  def like?(pattern)
    pattern.reverse_like?(self)
  end
  def reverse_like?(actual)
    actual == self
  end
end

class Array
  def reverse_like?(actual)
    return false unless actual.kind_of?(Array) && actual.size == self.size
    [actual, self].transpose.each do |actual_item, expected_item|
      return false unless actual_item.like?(expected_item)
    end
    true
  end
end
