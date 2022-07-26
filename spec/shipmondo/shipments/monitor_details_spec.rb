describe Shipmondo::Shipments::MonitorDetails do
  let(:json) { { shipment_id: 11460, events: [{ status: 'EN_ROUTE' }]} }
  subject { Shipmondo::Shipments::MonitorDetails.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the shipment id' do
    expect(subject.shipment_id).to eq 11460
  end

  it 'fetches the events' do
    expect(subject.events).to eq [{ 'status' => 'EN_ROUTE' }]
  end
end
