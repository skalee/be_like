require 'set'
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
#    expected_keys_wildcards, expected_keys_exact = self.keys.partition{ |k| k.kind_of?(Wildcard) } #TODO wildcards in keys
    expected_keys_exact = self.keys
    actual_keys = Set[*actual.keys]
    return false unless expected_keys_exact.size == actual_keys.size
    expected_keys_exact.each do |key|
      return false unless actual_keys.delete?(key) && actual[key].like?(self[key])
    end
    true
  end
end
