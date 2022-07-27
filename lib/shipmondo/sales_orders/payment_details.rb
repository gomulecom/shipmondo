module Shipmondo
  module SalesOrders
    class PaymentDetails
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def amount_excluding_vat
        BigDecimal(json.fetch('amount_excluding_vat'))
      end

      def amount_including_vat
        BigDecimal(json.fetch('amount_including_vat'))
      end

      def authorized_amount
        BigDecimal(json.fetch('authorized_amount'))
      end

      def currency_code
        json.fetch('currency_code')
      end

      def vat_amount
        BigDecimal(json.fetch('vat_amount'))
      end

      def vat_percent
        json.fetch('vat_percent').to_f
      end

      def payment_method
        json.fetch('payment_method')
      end

      def transaction_id
        json.fetch('transaction_id')
      end

      def payment_gateway_id
        json.fetch('payment_gateway_id')
      end
    end
  end
end
