require 'shipmondo/shipments/shipment'
require 'shipmondo/shipments/monitor_status'
require 'shipmondo/shipments/monitor_details'

module Shipmondo
  module Shipments
    class Client
      attr_reader :http

      def initialize(http)
        @http = http
      end

      def find(id)
        Shipment.new(http.get("shipments/#{id}"))
      end

      def monitor_statuses(shipment_ids)
        ids = if shipment_ids.is_a?(Array)
                shipment_ids.join(',')
              else
                shipment_ids
              end

        http.get("shipment_monitor_statuses?ids=#{ids}").body.map do |json|
          MonitorStatus.new(json)
        end
      end

      def monitor_details(shipment_ids)
        ids = if shipment_ids.is_a?(Array)
                shipment_ids.join(',')
              else
                shipment_ids
              end

        http.get("shipment_monitor_details?ids=#{ids}").body.map do |json|
          MonitorDetails.new(json)
        end
      end
    end
  end
end
