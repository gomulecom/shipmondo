require 'shipmondo/shipments/shipment'

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
    end
  end
end
