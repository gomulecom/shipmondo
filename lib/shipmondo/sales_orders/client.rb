require 'shipmondo/sales_orders/sales_order'

module Shipmondo
  module SalesOrders
    class Client
      attr_reader :http

      def initialize(http)
        @http = http
      end

      def find(id)
        json = http.get("sales_orders/#{id}")
        Shipmondo::SalesOrders::SalesOrder.new(json)
      end
    end
  end
end
