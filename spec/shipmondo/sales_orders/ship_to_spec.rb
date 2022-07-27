describe Shipmondo::SalesOrders::ShipTo do
  let(:json) { { name: 'Lene Hansen',
                 attention: nil,
                 address1: 'Skibhusvej 52',
                 address2: nil,
                 zipcode: '5000',
                 city: 'Odense C',
                 country_code: 'DK',
                 email: 'lene@email.dk',
                 mobile: '12345678',
                 telephone: '12345678',
                 instruction: 'Place on the front porch.' } }

  subject { Shipmondo::SalesOrders::ShipTo.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the name' do
    expect(subject.name).to eq 'Lene Hansen'
  end

  it 'fetches the attention' do
    expect(subject.attention).to be_nil
  end

  it 'fetches the first address line' do
    expect(subject.address1).to eq 'Skibhusvej 52'
  end

  it 'fetches the second address line' do
    expect(subject.address2).to be_nil
  end

  it 'fetches the zip code' do
    expect(subject.zipcode).to eq '5000'
  end

  it 'fetches the city' do
    expect(subject.city).to eq 'Odense C'
  end

  it 'fetches the country code' do
    expect(subject.country_code).to eq 'DK'
  end

  it 'fetches the email' do
    expect(subject.email).to eq 'lene@email.dk'
  end

  it 'fetches the mobile' do
    expect(subject.mobile).to eq '12345678'
  end

  it 'fetches the telephone' do
    expect(subject.telephone).to eq '12345678'
  end

  it 'fetches the instruction' do
    expect(subject.instruction).to eq 'Place on the front porch.'
  end
end
