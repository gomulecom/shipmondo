describe Shipmondo::Shipments::Shipment do
  let(:json) { { id: 1168 } }
  subject { Shipmondo::Shipments::Shipment.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the id' do
    expect(subject.id).to eq 1168
  end
end
