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

  describe :monitor_statuses do
    let(:shipments) { [{ shipment_id: 11460, current_state: 'PROGRESSING', current_status: 'EN_ROUTE' }, { shipment_id: 11461, current_state: 'PROGRESSING', current_status: 'EN_ROUTE'}] }

    before do
      stub_request(:get, 'https://app.shipmondo.com/api/public/v3/shipment_monitor_statuses')
        .with(query: { ids: shipments.map { |shipment| shipment[:shipment_id] }.join(',') })
        .to_return(headers: { content_type: 'application/json' },
                   body: JSON.generate(shipments))
    end

    it 'can list by array of ids' do
      ids = shipments.map { |shipment| shipment[:shipment_id] }

      statuses = subject.monitor_statuses(ids)
      expect(statuses).to all be_instance_of(Shipmondo::Shipments::MonitorStatus)
    end

    it 'can list by string of ids' do
      ids = shipments.map { |shipment| shipment[:shipment_id] }.join(",")

      statuses = subject.monitor_statuses(ids)
      expect(statuses).to all be_instance_of(Shipmondo::Shipments::MonitorStatus)
    end
  end

  describe :monitor_details do
    let(:shipments) { [{ shipment_id: 11460, events: [{ status: 'EN_ROUTE' }] }, { shipment_id: 11461, events: [{ status: 'EN_ROUTE' }] }] }

    before do
      stub_request(:get, 'https://app.shipmondo.com/api/public/v3/shipment_monitor_details')
        .with(query: { ids: shipments.map { |shipment| shipment[:shipment_id] }.join(',') })
        .to_return(headers: { content_type: 'application/json' },
                   body: JSON.generate(shipments))
    end

    it 'can list by array of ids' do
      ids = shipments.map { |shipment| shipment[:shipment_id] }

      details = subject.monitor_details(ids)
      expect(details).to all be_instance_of Shipmondo::Shipments::MonitorDetails
    end

    it 'can list by string of ids' do
      ids = shipments.map { |shipment| shipment[:shipment_id] }.join(",")

      details = subject.monitor_details(ids)
      expect(details).to all be_instance_of Shipmondo::Shipments::MonitorDetails
    end
  end
end
