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

      def search(order_id)
        http.get("sales_orders?order_id=#{order_id}").body.map do |data|
          data['ordered_at'] = DateTime.parse(data['ordered_at'])
          data.delete('service_point') if data.dig('service_point', 'id').nil?
          SalesOrder.new(data)
        end
      end

      def create(sales_order)
        sales_order.new(
          http.post('sales_orders', sales_order.as_json).body
        )
      end

      def update_note(id, note)
        http.put("sales_orders/#{id}/order_note", { order_note: note }.to_json).body
      end
    end
  end
end
