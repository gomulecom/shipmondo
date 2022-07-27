module Shipmondo
  module SalesOrders
    class OrderLine
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def id
        json.fetch('id')
      end

      def line_type
        json.fetch('line_type')
      end

      def item_sku
        json.fetch('item_sku')
      end

      def item_variant_code
        json.fetch('item_variant_code')
      end

      def item_name
        json.fetch('item_name')
      end

      def quantity
        json.fetch('quantity').to_f
      end

      def unit_price_excluding_vat
        BigDecimal(json.fetch('unit_price_excluding_vat'))
      end

      def discount_amount_excluding_vat
        BigDecimal(json.fetch('discount_amount_excluding_vat'))
      end

      def amount_excluding_vat
        BigDecimal(json.fetch('amount_excluding_vat'))
      end

      def amount_including_vat
        BigDecimal(json.fetch('amount_including_vat'))
      end

      def vat_amount
        BigDecimal(json.fetch('vat_amount'))
      end

      def vat_percent
        json.fetch('vat_percent').to_f
      end

      def currency_code
        json.fetch('currency_code')
      end

      def item_barcode
        json.fetch('item_barcode')
      end

      def item_bin
        json.fetch('item_bin')
      end

      def shipped_quantity
        json.fetch('shipped_quantity').to_f
      end

      def unit_weight
        json.fetch('unit_weight')
      end

      def image_url
        json.fetch('image_url')
      end

      def cost_price
        BigDecimal(json.fetch('cost_price'))
      end

      def country_code_of_origin
        json.fetch('country_code_of_origin')
      end

      def customs_commodity_code
        json.fetch('customs_commodity_code')
      end

      def customs_description
        json.fetch('customs_description')
      end
    end
  end
end
