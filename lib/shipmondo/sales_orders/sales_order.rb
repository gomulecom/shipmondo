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
      attribute :ship_to, ShipTo
      attribute :bill_to, BillTo
      attribute :payment_details, PaymentDetails
      attribute :service_point, Shipmondo::ServicePoints::ServicePoint
      attribute :order_lines, Types::Array.of(OrderLine)
    end
  end
end
