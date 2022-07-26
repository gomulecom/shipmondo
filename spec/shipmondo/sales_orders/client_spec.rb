require 'securerandom'

describe Shipmondo::SalesOrders::Client do
  subject { Shipmondo::Client.new(api_user: SecureRandom.uuid, api_key: SecureRandom.uuid).sales_orders }

  describe :find do
    let(:id) { 11227 }
    let(:order_id) { "27000" }

    before do
      stub_request(:get, "https://app.shipmondo.com/api/public/v3/sales_orders/#{id}")
        .to_return(headers: { content_type: 'application/json' },
                   body: JSON.generate({ id:, order_id: }))
    end

    it 'can find by id' do
      sales_order = subject.find(id)

      expect(sales_order).to be_instance_of Shipmondo::SalesOrders::SalesOrder
    end
  end
end
