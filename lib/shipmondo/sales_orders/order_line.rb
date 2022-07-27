require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module SalesOrders
    class OrderLine < Struct
      attribute :id, Types::Integer
      attribute :line_type, Types::String.enum('item', 'shipping', 'discount', 'gift_card', 'payment_fee')
      attribute :item_sku, Types::String
      attribute :item_variant_code, Types::String
      attribute :item_name, Types::String
      attribute :quantity, Types::Coercible::Float
      attribute :unit_price_excluding_vat, Types::Coercible::Decimal
      attribute :discount_amount_excluding_vat, Types::Coercible::Decimal
      attribute :amount_excluding_vat, Types::Coercible::Decimal
      attribute :amount_including_vat, Types::Coercible::Decimal
      attribute :vat_amount, Types::Coercible::Decimal
      attribute :vat_percent, Types::Coercible::Float
      attribute :currency_code, Types::String
      attribute :item_barcode, Types::String
      attribute :item_bin, Types::String
      attribute :shipped_quantity, Types::Coercible::Decimal
      attribute :unit_weight, Types::Integer
      attribute :image_url, Types::String
      attribute :cost_price, Types::Coercible::Decimal
      attribute :country_code_of_origin, Types::String
      attribute :customs_commodity_code, Types::String
      attribute :customs_description, Types::String
    end
  end
end
