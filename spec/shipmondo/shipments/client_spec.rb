require 'securerandom'

describe Shipmondo::Shipments::Client do
  subject { Shipmondo::Client.new(api_user: SecureRandom.uuid, api_key: SecureRandom.uuid).shipments }

  describe :find do
    let(:id) { 1168 }

    before do
      stub_request(:get, "https://app.shipmondo.com/api/public/v3/shipments/#{id}")
        .to_return(headers: { content_type: 'application/json' },
                   body: JSON.generate({ id: }))
    end

    it 'can find by id' do
      shipment = subject.find(id)

      expect(shipment).to be_instance_of Shipmondo::Shipments::Shipment
    end
  end
end
