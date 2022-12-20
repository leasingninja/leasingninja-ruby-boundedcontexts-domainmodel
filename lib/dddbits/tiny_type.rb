# frozen_string_literal: true

module DDDBits
  class TinyType
    class << self
      alias of new
    end

    attr_reader :value

    protected

    def initialize(value)
      @value = value
    end

    public

    def to_s
      "#{self.class.name.split('::').last} [#{@value}]"
    end

    def ==(other)
      if other.is_a? self.class
        @value == other.value
      else
        false
      end
    end

    alias eql? ==

    def hash
      @value.hash
    end
  end
end
