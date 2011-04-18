class Object
  def like?(pattern)
    pattern.reverse_like?(self)
  end
  protected
  def reverse_like?(actual)
    actual == self
  end
end
