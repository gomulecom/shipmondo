describe Shipmondo::ServicePoints::ServicePoint do
  let(:json) { { id: '95558',
                 name: 'Påskeløkkens Købmand',
                 address1: 'Paaskeløkkevej 11',
                 address2: nil,
                 zipcode: '5000',
                 city: 'Odense C',
                 country_code: 'DK' } }

  subject { Shipmondo::ServicePoints::ServicePoint.new(JSON.parse(JSON.generate(json))) }

  it 'fetches the id' do
    expect(subject.id).to eq 95558
  end

  it 'fetches the name' do
    expect(subject.name).to eq 'Påskeløkkens Købmand'
  end

  it 'fetches the first address line' do
    expect(subject.address1).to eq 'Paaskeløkkevej 11'
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

  it 'fetches the country' do
    expect(subject.country_code).to eq 'DK'
  end
end
