require 'shipmondo/concerns/addressable'

module Shipmondo
  module SalesOrders
    class ShipTo
      include Shipmondo::Concerns::Addressable
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def name
        json.fetch('name')
      end

      def attention
        json.fetch('attention')
      end

      def email
        json.fetch('email')
      end

      def mobile
        json.fetch('mobile')
      end

      def telephone
        json.fetch('telephone')
      end

      def instruction
        json.fetch('instruction')
      end
    end
  end
end
