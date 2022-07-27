require 'shipmondo/types'

module Shipmondo
  module Concerns
    module Addressable
      def self.included(base)
        base.attribute :address1, Types::String
        base.attribute :address2, Types::String.optional
        base.attribute :zipcode, Types::String
        base.attribute :city, Types::String
        base.attribute :country_code, Types::String
      end
    end
  end
end
