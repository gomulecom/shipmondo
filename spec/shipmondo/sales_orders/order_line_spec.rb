describe Shipmondo::SalesOrders::OrderLine do
  let(:json) { { id: 1234,
                 line_type: 'item',
                 item_sku: 'TS001-WH',
                 item_variant_code: 'White',
                 item_name: 'T-Shirt',
                 quantity: '2.0',
                 unit_price_excluding_vat: '800.0',
                 discount_amount_excluding_vat: '0.0',
                 amount_excluding_vat: '1600.0',
                 amount_including_vat: '2000.0',
                 vat_amount: '400.0',
                 vat_percent: '0.25',
                 currency_code: 'DKK',
                 item_barcode: '12345678',
                 item_bin: 'AB-001',
                 shipped_quantity: '0.0',
                 unit_weight: 2000,
                 image_url: 'http://example.com/image',
                 cost_price: '50.0',
                 country_code_of_origin: 'DK',
                 customs_commodity_code: '123456',
                 customs_description: 'Example contents' } }

  subject { Shipmondo::SalesOrders::OrderLine.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the id' do
    expect(subject.id).to eq 1234
  end

  it 'fetches the line type' do
    expect(subject.line_type).to eq 'item'
  end

  it 'fetches the item sku' do
    expect(subject.item_sku).to eq 'TS001-WH'
  end

  it 'fetches the item variant code' do
    expect(subject.item_variant_code).to eq 'White'
  end

  it 'fetches the item name' do
    expect(subject.item_name).to eq 'T-Shirt'
  end

  it 'fetches the quantity' do
    expect(subject.quantity).to eq 2.0
  end

  it 'fetches the unit price excluding vat' do
    expect(subject.unit_price_excluding_vat).to eq BigDecimal('800.0')
  end

  it 'fetches the discount amount excluding vat' do
    expect(subject.discount_amount_excluding_vat).to eq BigDecimal('0.0')
  end

  it 'fetches the amount excluding vat' do
    expect(subject.amount_excluding_vat).to eq BigDecimal('1600.0')
  end

  it 'fetches the amount including vat' do
    expect(subject.amount_including_vat).to eq BigDecimal('2000.0')
  end

  it 'fetches the vat amount' do
    expect(subject.vat_amount).to eq BigDecimal('400.0')
  end

  it 'fetches the vat persent' do
    expect(subject.vat_percent).to eq 0.25
  end

  it 'fetches the currency code' do
    expect(subject.currency_code).to eq 'DKK'
  end

  it 'fetches the item barcode' do
    expect(subject.item_barcode).to eq '12345678'
  end

  it 'fetches the item bin' do
    expect(subject.item_bin).to eq 'AB-001'
  end

  it 'fetches the shipped quantity' do
    expect(subject.shipped_quantity).to eq 0.0
  end

  it 'fetches the unit weight' do
    expect(subject.unit_weight).to eq 2000
  end

  it 'fetches the image url' do
    expect(subject.image_url).to eq 'http://example.com/image'
  end

  it 'fetches the cost price' do
    expect(subject.cost_price).to eq BigDecimal('50.0')
  end

  it 'fetches the country code of origin' do
    expect(subject.country_code_of_origin).to eq 'DK'
  end

  it 'fetches the customs commodity code' do
    expect(subject.customs_commodity_code).to eq '123456'
  end

  it 'fetches the customs description' do
    expect(subject.customs_description).to eq 'Example contents'
  end
end
