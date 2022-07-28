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

      def as_json
        {
          name: name,
          attention: attention,
          address1: address1,
          address2: address2,
          zipcode: zipcode,
          city: city,
          country_code: country_code,
          email: email,
          mobile: mobile,
          telephone: telephone,
          instruction: instruction
        }.compact
      end
    end
  end
end
