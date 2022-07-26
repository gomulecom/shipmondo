describe Shipmondo::Shipments::MonitorStatus do
  let(:json) { { shipment_id: 11460, current_state: 'PROGRESSING', current_status: 'EN_ROUTE' } }
  subject { Shipmondo::Shipments::MonitorStatus.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the shipment id' do
    expect(subject.shipment_id).to eq 11460
  end

  it 'fetches the current state' do
    expect(subject.current_state).to eq 'PROGRESSING'
  end

  it 'fetches the current status' do
    expect(subject.current_status).to eq 'EN_ROUTE'
  end
end
