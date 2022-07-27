require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module SalesOrders
    class PaymentDetails < Struct
      attribute :amount_excluding_vat, Types::Coercible::Decimal
      attribute :amount_including_vat, Types::Coercible::Decimal
      attribute :authorized_amount, Types::Coercible::Decimal
      attribute :currency_code, Types::String
      attribute :vat_amount, Types::Coercible::Decimal
      attribute :vat_percent, Types::Coercible::Float
      attribute :payment_method, Types::String
      attribute :transaction_id, Types::String
      attribute :payment_gateway_id, Types::Coercible::String
    end
  end
end
