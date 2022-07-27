module Shipmondo
  module Concerns
    module Addressable
      def address_1
        json.fetch('address1')
      end

      def address_2
        json.fetch('address2')
      end

      def zip_code
        json.fetch('zipcode')
      end

      def city
        json.fetch('city')
      end

      def country_code
        json.fetch('country_code')
      end
    end
  end
end
