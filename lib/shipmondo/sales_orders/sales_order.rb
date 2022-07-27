require 'shipmondo/sales_orders/bill_to'
require 'shipmondo/sales_orders/ship_to'
require 'shipmondo/sales_orders/payment_details'
require 'shipmondo/sales_orders/order_line'

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

      def ship_to
        ShipTo.new(json.fetch('ship_to')) if json.key?('ship_to')
      end

      def bill_to
        BillTo.new(json.fetch('bill_to')) if json.key?('bill_to')
      end

      def payment_details
        PaymentDetails.new(json.fetch('payment_details')) if json.key?('payment_details')
      end

      def service_point
        Shipmondo::ServicePoints::ServicePoint.new(json.fetch('service_point')) if json.key?('service_point')
      end

      def order_lines
        if json.key?('order_lines')
          json.fetch('order_lines').map do |order_line|
            OrderLine.new(order_line)
          end
        else
          []
        end
      end
    end
  end
end
