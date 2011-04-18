module Wildcard
  class Wildcard ; end

  class TypeWildcard < Wildcard
    def initialize(type)
      @type = type
    end

    def reverse_like?(actual)
      actual.kind_of?(@type)
    end
  end

  class AnythingWildcard < Wildcard
    def initialize(allow_nil)
      @allow_nil = allow_nil
    end
    def reverse_like?(actual)
      @allow_nil || !actual.nil?
    end
  end

  def self.anything
    AnythingWildcard.new(true)
  end

  def self.not_nil
    AnythingWildcard.new(false)
  end

  def self.respond_to? name, include_private = false
    analyze_method_name(name) ? true : super
  end

  def self.method_missing name, *args, &block
    args.empty? && block.nil? && analyze_method_name(name) or super
  end

  def self.analyze_method_name(name)
    case name.to_s
    when /\Aany_(\w+)\Z/
      type_name = $1.capitalize
      return false unless Object.const_defined?(type_name)
      TypeWildcard.new(Object.const_get(type_name))
    else
      false
    end
  end

end
