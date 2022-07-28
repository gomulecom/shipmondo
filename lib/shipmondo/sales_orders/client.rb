require 'shipmondo/sales_orders/sales_order'

module Shipmondo
  module SalesOrders
    class Client
      attr_reader :http

      def initialize(http)
        @http = http
      end

      def find(id)
        SalesOrder.new(http.get("sales_orders/#{id}").body)
      end

      def create(sales_order)
        sales_order.new(
          http.post('sales_orders', sales_order.as_json).body
        )
      end
    end
  end
end
