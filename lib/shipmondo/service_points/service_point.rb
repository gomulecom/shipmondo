require 'shipmondo/concerns/addressable'
require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module ServicePoints
    class ServicePoint < Struct
      include Shipmondo::Concerns::Addressable

      attribute :id, Types::Coercible::Integer
      attribute :name, Types::String
    end
  end
end
