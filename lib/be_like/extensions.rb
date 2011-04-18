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

class Hash
  def reverse_like?(actual)
    expected_keys_wildcards, expected_keys_exact = self.keys.partition{ |k| k.kind_of?(Wildcard) }
    actual_keys = Set.new(actual.keys)
    expected_keys_exact.each do |key|

    end
  end
end
