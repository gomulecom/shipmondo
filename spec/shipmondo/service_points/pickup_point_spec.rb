describe Shipmondo::ServicePoints::PickupPoint do
  let(:json) { { id: '95558', name: 'Påskeløkkens Købmand', address: 'Paaskeløkkevej 11', zip_code: '5000', city: 'Odense C', country: 'DK' } }
  subject { Shipmondo::ServicePoints::PickupPoint.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the id' do
    expect(subject.id).to eq '95558'
  end

  it 'fetches the name' do
    expect(subject.name).to eq 'Påskeløkkens Købmand'
  end

  it 'fetches the address' do
    expect(subject.address).to eq 'Paaskeløkkevej 11'
  end

  it 'fetches the zip_code' do
    expect(subject.zip_code).to eq '5000'
  end

  it 'fetches the city' do
    expect(subject.city).to eq 'Odense C'
  end

  it 'fetches the country' do
    expect(subject.country).to eq 'DK'
  end
end
