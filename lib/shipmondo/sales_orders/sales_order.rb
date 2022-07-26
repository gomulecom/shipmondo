module Shipmondo
  module SalesOrders
    class SalesOrder
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def id
        json.fetch('id')
      end

      def order_id
        json.fetch('order_id')
      end
    end
  end
end
