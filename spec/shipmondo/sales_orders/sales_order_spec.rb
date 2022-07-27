describe Shipmondo::SalesOrders::SalesOrder do
  let(:json) { { id: 11227,
                 order_id: "27000",
                 ship_to: { name: 'Lene Hansen', attention: nil, address1: 'Skibhusvej 52', address2: nil, zipcode: '5000', city: 'Odense C', country_code: 'DK', email: 'lene@email.dk', mobile: '12345678', telephone: '12345678', instruction: 'Place on the front porch.' },
                 bill_to: { name: 'Lene Hansen', attention: nil, address1: 'Skibhusvej 52', address2: nil, zipcode: '5000', city: 'Odense C', country_code: 'DK', email: 'lene@email.dk', mobile: '12345678', telephone: '12345678' },
                 service_point: { id: '95558', name: 'Påskeløkkens Købmand', address1: 'Paaskeløkkevej 11', zipcode: '5000', city: 'Odense C', country_code: 'DK' },
                 payment_details: { amount_excluding_vat: '1600.0', amount_including_vat: '2000.0', authorized_amount: '2000.0', currency_code: 'DKK', vat_amount: '400.0', vat_percent: '0.25', payment_method: 'quickpay', transaction_id: '123456789', payment_gateway_id: 4012 },
                 order_lines: [
                  { line_type: 'item', item_name: 'T-Shirt', item_sku: 'TS001-WH', item_variant_code: 'White', quantity: 2, unit_price_excluding_vat: '800.0', discount_amount_excluding_vat: '0.0', vat_percent: '0.25', currency_code: 'DKK', unit_weight: 2000, item_barcode: '12345678', item_bin: 'AB-001', image_url: 'http://example.com/image', cost_price: '50.0', country_code_of_origin: 'DK', customs_commodity_code: '123456', customs_description: 'Example contents' }
                 ] } }

  subject { Shipmondo::SalesOrders::SalesOrder.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the id' do
    expect(subject.id).to eq 11227
  end

  it 'fetches the order id' do
    expect(subject.order_id).to eq "27000"
  end

  it 'returns the ship to' do
    expect(subject.ship_to).to be_instance_of Shipmondo::SalesOrders::ShipTo
  end

  it 'returns the bill to' do
    expect(subject.bill_to).to be_instance_of Shipmondo::SalesOrders::BillTo
  end

  it 'returns the pickup point based on the service point' do
    expect(subject.service_point).to be_instance_of Shipmondo::ServicePoints::ServicePoint
  end

  it 'returns the payment details' do
    expect(subject.payment_details).to be_instance_of Shipmondo::SalesOrders::PaymentDetails
  end

  it 'returns an array of order lines' do
    expect(subject.order_lines).to all be_instance_of Shipmondo::SalesOrders::OrderLine
  end
end
