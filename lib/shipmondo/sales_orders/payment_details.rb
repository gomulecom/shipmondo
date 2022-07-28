require 'shipmondo/struct'
require 'shipmondo/types'

module Shipmondo
  module SalesOrders
    class PaymentDetails < Struct
      attribute :amount_excluding_vat, Types::Coercible::Decimal.optional
      attribute :amount_including_vat, Types::Coercible::Decimal
      attribute :authorized_amount, Types::Coercible::Decimal.optional
      attribute :currency_code, Types::String
      attribute :vat_amount, Types::Coercible::Decimal
      attribute :vat_percent, Types::Coercible::Float.optional
      attribute :payment_method, Types::String.optional
      attribute :transaction_id, Types::String.optional
      attribute :payment_gateway_id, Types::Coercible::String.optional

      def as_json
        {
          amount_excluding_vat: amount_excluding_vat.to_s('F'),
          amount_including_vat: amount_including_vat.to_s('F'),
          authorized_amount: authorized_amount.to_s('F'),
          currency_code: currency_code,
          vat_amount: vat_amount.to_s('F'),
          vat_percent: vat_percent.to_s,
          payment_method: payment_method,
          transaction_id: transaction_id,
          payment_gateway_id: payment_gateway_id,
        }.compact
      end
    end
  end
end
