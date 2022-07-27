require 'shipmondo/concerns/addressable'
require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module SalesOrders
    class ShipTo < Struct
      include Shipmondo::Concerns::Addressable

      attribute :name, Types::String
      attribute :attention, Types::String.optional
      attribute :email, Types::String.optional
      attribute :mobile, Types::String.optional
      attribute :telephone, Types::String.optional
      attribute :instruction, Types::String.optional
    end
  end
end
