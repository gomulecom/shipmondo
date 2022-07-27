require 'dry-struct'

module Shipmondo
  class Struct < Dry::Struct
    transform_keys(&:to_sym)

    def self.attribute(key, type)
      super("#{key.to_s}?".to_sym, type)
    end
  end
end
