module Shipmondo
  module Shipments
    class MonitorDetails
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def shipment_id
        json.fetch('shipment_id')
      end

      def events
        json.fetch('events')
      end
    end
  end
end
