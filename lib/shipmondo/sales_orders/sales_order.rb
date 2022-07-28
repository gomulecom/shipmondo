require 'shipmondo/sales_orders/bill_to'
require 'shipmondo/sales_orders/order_line'
require 'shipmondo/sales_orders/payment_details'
require 'shipmondo/sales_orders/ship_to'
require 'shipmondo/service_points/service_point'
require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module SalesOrders
    class SalesOrder < Struct
      attribute :id, Types::Integer
      attribute :order_id, Types::String
      attribute :ordered_at, Types::DateTime
      attribute :ship_to, ShipTo
      attribute :bill_to, BillTo
      attribute :payment_details, PaymentDetails
      attribute :service_point, Shipmondo::ServicePoints::ServicePoint.optional
      attribute :order_lines, Types::Array.of(OrderLine)

      def as_json
        {
          order_id: order_id,
          ordered_at: ordered_at&.iso8601,
          ship_to: ship_to&.as_json,
          bill_to: bill_to&.as_json,
          payment_details: payment_details&.as_json,
          service_point: service_point&.as_json,
          order_lines: order_lines&.map(&:as_json)
        }.compact
      end
    end
  end
end
