require 'faraday'
require 'shipmondo/sales_orders/client'
require 'shipmondo/service_points/client'
require 'shipmondo/shipments/client'

module Shipmondo
  class Client
    attr_reader :http

    def initialize(api_user:, api_key:)
      @http = Faraday.new('https://app.shipmondo.com/api/public/v3/') do |f|
        f.request :authorization, :basic, api_user, api_key
        f.request :json
        f.response :json
      end
    end

    def sales_orders
      SalesOrders::Client.new(http)
    end

    def service_points
      ServicePoints::Client.new(http)
    end

    def shipments
      Shipments::Client.new(http)
    end
  end
end
