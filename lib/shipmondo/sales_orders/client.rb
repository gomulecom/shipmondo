require 'shipmondo/sales_orders/sales_order'

module Shipmondo
  module SalesOrders
    class Client
      attr_reader :http

      def initialize(http)
        @http = http
      end

      def find(id)
        SalesOrder.new(http.get("sales_orders/#{id}"))
      end
    end
  end
end
