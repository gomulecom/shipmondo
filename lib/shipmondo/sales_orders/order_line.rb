require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module SalesOrders
    class OrderLine < Struct
      attribute :id, Types::Integer
      attribute :line_type, Types::String.enum('item', 'shipping', 'discount', 'gift_card', 'payment_fee')
      attribute :item_sku, Types::String
      attribute :item_variant_code, Types::String.optional
      attribute :item_name, Types::String
      attribute :quantity, Types::Coercible::Float
      attribute :unit_price_excluding_vat, Types::Coercible::Decimal.optional
      attribute :discount_amount_excluding_vat, Types::Coercible::Decimal.optional
      attribute :amount_excluding_vat, Types::Coercible::Decimal.optional
      attribute :amount_including_vat, Types::Coercible::Decimal.optional
      attribute :vat_amount, Types::Coercible::Decimal.optional
      attribute :vat_percent, Types::Coercible::Float.optional
      attribute :currency_code, Types::String
      attribute :item_barcode, Types::String.optional
      attribute :item_bin, Types::String.optional
      attribute :shipped_quantity, Types::Coercible::Decimal.optional
      attribute :unit_weight, Types::Integer.optional
      attribute :image_url, Types::String.optional
      attribute :cost_price, Types::Coercible::Decimal.optional
      attribute :country_code_of_origin, Types::String.optional
      attribute :customs_commodity_code, Types::String.optional
      attribute :customs_description, Types::String.optional

      def as_json
        {
          line_type: line_type,
          item_name: item_name,
          item_sku: item_sku,
          item_variant_code: item_variant_code,
          quantity: quantity&.to_i,
          unit_price_excluding_vat: unit_price_excluding_vat&.to_s('F'),
          discount_amount_excluding_vat: discount_amount_excluding_vat&.to_s('F'),
          vat_percent: vat_percent&.to_s,
          currency_code: currency_code,
          unit_weight: unit_weight,
          item_barcode: item_barcode,
          item_bin: item_bin,
          image_url: image_url,
          cost_price: cost_price&.to_s('F'),
          country_code_of_origin: country_code_of_origin,
          customs_commodity_code: customs_commodity_code,
          customs_description: customs_description,
        }.compact
      end
    end
  end
end
