require 'shipmondo/service_points/service_point'

module Shipmondo
  module ServicePoints
    class Client
      attr_reader :http

      def initialize(http)
        @http = http
      end

      def pickup_points(carrier_code:, address: nil, city: nil, zip_code:, country_code:)
        http.get('pickup_points', carrier_code:, address:, city:, zip_code:, country_code:).body.map do |json|
          ServicePoint.new(json)
        end
      end
    end
  end
end
