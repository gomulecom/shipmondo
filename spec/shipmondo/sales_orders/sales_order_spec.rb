describe Shipmondo::SalesOrders::SalesOrder do
  let(:json) { { id: 11227, order_id: "27000" } }
  subject { Shipmondo::SalesOrders::SalesOrder.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the id' do
    expect(subject.id).to eq 11227
  end

  it 'fetches the order id' do
    expect(subject.order_id).to eq "27000"
  end
end
