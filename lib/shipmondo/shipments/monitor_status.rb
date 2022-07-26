module Shipmondo
  module Shipments
    class MonitorStatus
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def shipment_id
        json.fetch('shipment_id')
      end

      def current_state
        json.fetch('current_state')
      end

      def current_status
        json.fetch('current_status')
      end
    end
  end
end
