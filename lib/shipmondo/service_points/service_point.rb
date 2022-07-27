require 'shipmondo/concerns/addressable'

module Shipmondo
  module ServicePoints
    class ServicePoint
      include Shipmondo::Concerns::Addressable
      attr_reader :json

      def initialize(json)
        @json = json
      end

      def id
        json.fetch('id')
      end

      def name
        json.fetch('name')
      end
    end
  end
end
