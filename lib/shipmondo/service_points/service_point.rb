require 'shipmondo/concerns/addressable'
require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module ServicePoints
    class ServicePoint < Struct
      include Shipmondo::Concerns::Addressable

      attribute :id, Types::Coercible::Integer
      attribute :name, Types::String

      def as_json
        {
          id: id.to_s,
          name: name,
          address1: address1,
          address2: address2,
          zipcode: zipcode,
          city: city,
          country_code: country_code
        }.compact
      end
    end
  end
end
