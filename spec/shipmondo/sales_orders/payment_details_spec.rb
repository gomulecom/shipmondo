describe Shipmondo::SalesOrders::PaymentDetails do
  let(:json) { { amount_excluding_vat: '1600.0',
                 amount_including_vat: '2000.0',
                 authorized_amount: '2000.0',
                 currency_code: 'DKK',
                 vat_amount: '400.0',
                 vat_percent: '0.25',
                 payment_method: 'quickpay',
                 transaction_id: '123456789',
                 payment_gateway_id: '4012' } }

  subject { Shipmondo::SalesOrders::PaymentDetails.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the amount excluding vat' do
    expect(subject.amount_excluding_vat).to eq BigDecimal('1600.0')
  end

  it 'fetches the amount including vat' do
    expect(subject.amount_including_vat).to eq BigDecimal('2000.0')
  end

  it 'fetches the authorized amount' do
    expect(subject.authorized_amount).to eq BigDecimal('2000.0')
  end

  it 'fetches the currency code' do
    expect(subject.currency_code).to eq 'DKK'
  end

  it 'fetches the vat amount' do
    expect(subject.vat_amount).to eq BigDecimal('400.0')
  end

  it 'fetches the vat persent' do
    expect(subject.vat_percent).to eq 0.25
  end

  it 'fetches the payment method' do
    expect(subject.payment_method).to eq 'quickpay'
  end

  it 'fetches the transaction id' do
    expect(subject.transaction_id).to eq '123456789'
  end

  it 'fetches the payment gateway id' do
    expect(subject.payment_gateway_id).to eq '4012'
  end
end
