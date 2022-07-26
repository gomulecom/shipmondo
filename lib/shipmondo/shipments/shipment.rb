module Shipmondo
  module Shipments
    class Shipment
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def id
        json.fetch('id')
      end
    end
  end
end
