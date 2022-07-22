module Shipmondo
  module ServicePoints
    class PickupPoint
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def id
        json.fetch('id')
      end

      def name
        json.fetch('name')
      end

      def address
        json.fetch('address')
      end

      def zip_code
        json.fetch('zip_code')
      end

      def city
        json.fetch('city')
      end

      def country
        json.fetch('country')
      end
    end
  end
end
