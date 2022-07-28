require 'shipmondo/concerns/addressable'
require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module ServicePoints
    class ServicePoint < Struct
      include Shipmondo::Concerns::Addressable

      attribute :id, Types::Coercible::Integer
      attribute :name, Types::String

      def self.new(data)
        if data.key?('country') && !data.key?('country_code')
          data['country_code'] = data['country']
        end

        if data.key?('address') && !data.key?('address1')
          data['address1'] = data['address']
        end

        super
      end

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
